using UnityEngine;
using UnityEngine.Events;

public class collectables : MonoBehaviour
{
    #region Inspector

    [SerializeField] private State state;

    [SerializeField] private UnityEvent onCollected;

    #endregion


    public void Collect()
    {
        onCollected.Invoke();
        FindObjectOfType<GameState>().Add(state);
        Destroy(gameObject);
    }
    
}
