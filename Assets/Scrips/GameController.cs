

using UnityEngine;

public class GameController : MonoBehaviour
{
    private PlayerController player;

    private DialogueController dialogueController;
    #region Unity Event Functions

    
    private void Awake()
    {
        player = FindObjectOfType<PlayerController>();

        if (player == null)
        {
            Debug.LogError("no player found in scene.", this);
        }

        dialogueController = FindObjectOfType<DialogueController>();

        if (dialogueController == null)
        {
            Debug.LogError("no DialogueController found in scene", this);
        }
    }

    private void OnEnable()
    {
        DialogueController.DialogueClosed += EndDialogue;
    }

    private void OnDisable()
    {
        DialogueController.DialogueOpened -= EndDialogue;
    }

    private void Start()
    {
        EnterPlayMode();
    }

    #endregion
    #region modes

    private void EnterPlayMode()
    {
        Cursor.lockState = CursorLockMode.Locked;
        player.EnableInput();
    }

    private void EnterDialogueMode()
    {
        Cursor.lockState = CursorLockMode.Locked;
        player.DisableInput();
    }

    private void EndDialogue()
    {
        EnterPlayMode();
    }
    #endregion

    public void StartDialogue(string dialoguePath)
    {
        EnterDialogueMode();
        dialogueController.StartDialogue(dialoguePath);
    }
}
