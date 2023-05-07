using UnityEngine;

public class InkDialogue : MonoBehaviour
{
    #region Inspector

    [SerializeField] private string dialoguePath;

    #endregion

    public void StartDialogue()
    {
        if (string.IsNullOrWhiteSpace(dialoguePath))
        {
            Debug.LogWarning("No dialogue path defind");
            return;
        }
        
        FindObjectOfType<GameController>().StartDialogue(dialoguePath);
    }
    #region Unity Event Functions



    #endregion
}
