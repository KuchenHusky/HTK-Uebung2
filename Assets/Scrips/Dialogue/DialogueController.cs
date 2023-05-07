using System;
using UnityEngine;
using Ink;
using Ink.Runtime;
using System.Collections.Generic;
using System.Linq;
using UnityEngine.EventSystems;



public class DialogueController : MonoBehaviour
{
    private const string SpeakerSeperator = ":";
    private const string EscapedColon = "::";
    private const string EscapedColonPlaceholder = "§";
    
    public static event Action DialogueOpened;
    public static event Action DialogueClosed;


    public static event Action<string> InkEvent;
    #region Inspector

    [Header("Ink")]
    [Tooltip("Compiled ink text asset")]
    [SerializeField] TextAsset inkAsset;

    [Header("Ui")]
    [SerializeField] private DialogueBox dialogueBox;
    #endregion
    
    #region Privat Variables

    private Story inkStory;

    #endregion
    
    #region Unity Event Functions 

    private void Awake()
    {
        inkStory = new Story(inkAsset.text);

        inkStory.onError += OnInkError;
        
        inkStory.BindExternalFunction<string>("Event", Event);
    }

    private void Start()
    {
        dialogueBox.gameObject.SetActive(false);
    }

    private void OnDestroy()
    {
        inkStory.onError -= OnInkError;
    }

    private void OnEnable()
    {
        DialogueBox.DialogueContinued += OnDialogueContinue;
        DialogueBox.ChoiceSelected += OnChoiceSelected;
    }

    private void OnDisable()
    {
        DialogueBox.DialogueContinued -= OnDialogueContinue;
        DialogueBox.ChoiceSelected -= OnChoiceSelected;
        
    }
    #endregion

    #region Ink

    private DialogueLine ParaseText(string inkLine, List<string> tags)
    {
        inkLine = inkLine.Replace(EscapedColon, EscapedColonPlaceholder);
        //splits text into parts at :
        List<string> parts = inkLine.Split(SpeakerSeperator).ToList();
        string speaker;
        string text;

        switch (parts.Count)
        {
            case 1:
                speaker = null;
                text = parts[0];
                break;
                
            case 2:
                speaker = parts[0];
                text = parts[1];
                break;
            
                default:
                Debug.LogWarning($@"Ink duialogue line was split at more {SpeakerSeperator} than expected. Please make sure to use {EscapedColon} for {SpeakerSeperator} inside next");
                goto case 2;
                
        }
        DialogueLine line = new DialogueLine();

        line.speaker = speaker?.Trim();
        line.text = text.Trim().Replace(EscapedColonPlaceholder, SpeakerSeperator);


        for (int i = 0; i < tags.Count; i++)
        {
            switch (tags[i])
            {
                case "though":
                    line.text = $"<i>{line.text}<i>";
                    break;
                
                case "portrait":
                    List<string> portraiparts = tags[i].Split(SpeakerSeperator).ToList();
                    if (portraiparts[1] == "player")
                    {
                        
                    }
                    break;
            }
        }
        
        if (tags.Contains("thought"))
        {
            //line.text = "<i>" + line.text + "<i>"; andere schreibweise
            line.text = $"<i>{line.text}<i>";
        }
        return line;
    }
    
    
    private bool CanContinue()
    {
        return inkStory.canContinue;
    }

    #region Dialogue Lifecycle

    public void StartDialogue(string dialoguePath)
    {
        OpenDialogue();
        
        inkStory.ChoosePathString(dialoguePath);
        ContinueDialogue();
    }

    private void OpenDialogue()
    {
        dialogueBox.gameObject.SetActive(true);
        DialogueOpened?.Invoke();
        
    }

    private void CloseDialogue()
    {
        EventSystem.current.SetSelectedGameObject(null);
        dialogueBox.gameObject.SetActive(false);
        DialogueClosed?.Invoke();
    }
    private void ContinueDialogue()
    {
        if (IsAtEnd())
        {
            CloseDialogue();
            return;
        }

        DialogueLine line = new DialogueLine();
        
        if (CanContinue())
        {
            string inkLine = inkStory.Continue();

            if (string.IsNullOrWhiteSpace(inkLine))
            {
                ContinueDialogue();
                return;
            }
            
            line.text = inkLine;
            line = ParaseText(inkLine, inkStory.currentTags);
        }
        else
        {
            line = new DialogueLine();
        }
        
        line.choices = inkStory.currentChoices;
        dialogueBox.DisplayText(line);
    }

    private void SelectChoices(int choiceIndex)
    {
        inkStory.ChooseChoiceIndex(choiceIndex);
        ContinueDialogue();
    }
    private void OnDialogueContinue(DialogueBox _)
    {
        ContinueDialogue();
    }

    private void OnChoiceSelected(DialogueBox _, int choiceIndex)
    {
        SelectChoices(choiceIndex);
    }
    
    #endregion
    private bool HasChoices()
    {
        return inkStory.currentChoices.Count > 0;
    }

    private bool IsAtEnd()
    {
        return !CanContinue() && !HasChoices();
    }
    private void OnInkError(string message, ErrorType type)
    {
        switch (type)
        {
            case ErrorType.Author:
                Debug.Log(message);
                break;
            
            case ErrorType.Warning:
                Debug.Log(message);
                break;
            
            case ErrorType.Error:
                Debug.Log(message);
                break;
            default:
                throw new ArgumentOutOfRangeException(nameof(type), type, null);
        }
    }

    private void Event(string eventName)
    {
        InkEvent?.Invoke(eventName);
    }
    
    #endregion
}
public struct DialogueLine
{
    public string speaker;

    public string text;

    public List<Choice> choices;
}