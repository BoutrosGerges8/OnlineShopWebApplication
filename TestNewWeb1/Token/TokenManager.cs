using System;
using System.Web;
using System.Web.SessionState;

namespace TestNewWeb1
{
    public class TokenManager
    {
        // Session key to store user credentials
        private static string SessionKey = "UserCredentials";

        #region Token Storage in Session

        /// <summary>
        /// Add user credentials (email and password) to the session.
        /// </summary>
        public static void AddCredentialsToSession(HttpSessionState session, string email, string password)
        {
            var credentials = new { Email = email, Password = password };
            session[SessionKey] = credentials;
        }

        /// <summary>
        /// Get the user credentials (email and password) from the session.
        /// </summary>
        public static dynamic GetCredentialsFromSession(HttpSessionState session)
        {
            return session[SessionKey];
        }

        /// <summary>
        /// Delete the user credentials from the session.
        /// </summary>
        public static void DeleteCredentialsFromSession(HttpSessionState session)
        {
            session.Remove(SessionKey);
        }

        #endregion

        #region Credential Management

        /// <summary>
        /// Check if the user credentials exist in the session.
        /// </summary>
        public static bool CredentialsExistInSession(HttpSessionState session)
        {
            return session[SessionKey] != null;
        }

        /// <summary>
        /// Update the user credentials in the session (replace with new credentials).
        /// </summary>
        public static void UpdateCredentialsInSession(HttpSessionState session, string newEmail, string newPassword)
        {
            var newCredentials = new { Email = newEmail, Password = newPassword };
            session[SessionKey] = newCredentials;
        }

        #endregion
    }
}
