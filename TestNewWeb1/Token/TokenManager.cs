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
        /// Add user credentials (email, password, user ID, and isAdmin) to the session.
        /// </summary>
        public static void AddCredentialsToSession(HttpSessionState session, string email, string password, int userId, bool isAdmin = false)
        {
            var credentials = new
            {
                Email = email,
                Password = password,
                UserId = userId,
                IsAdmin = isAdmin
            };
            session[SessionKey] = credentials;
        }

        /// <summary>
        /// Get the user credentials (email, password, user ID, and isAdmin) from the session.
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
        public static void UpdateCredentialsInSession(HttpSessionState session, string newEmail, string newPassword, int newUserId, bool newIsAdmin)
        {
            var newCredentials = new
            {
                Email = newEmail,
                Password = newPassword,
                UserId = newUserId,
                IsAdmin = newIsAdmin
            };
            session[SessionKey] = newCredentials;
        }

        #endregion

        #region Utility Methods

        /// <summary>
        /// Get the User ID from session.
        /// </summary>
        public static int GetUserIdFromSession(HttpSessionState session)
        {
            var credentials = GetCredentialsFromSession(session);
            return credentials != null ? credentials.UserId : 0; // Return 0 if not available
        }

        /// <summary>
        /// Check if the user is an admin based on session data.
        /// </summary>
        public static bool IsUserAdmin(HttpSessionState session)
        {
            var credentials = GetCredentialsFromSession(session);
            return credentials != null && credentials.IsAdmin; // Default to false if not available
        }

        /// <summary>
        /// Check if the user is already logged in by checking if credentials exist in the session.
        /// </summary>
        public static bool IsLoggedInAlready(HttpSessionState session)
        {
            return CredentialsExistInSession(session); // Check if user credentials exist in session
        }

        #endregion
    }
}




//using System;
//using System.Web;
//using System.Web.SessionState;

//namespace TestNewWeb1
//{
//    public class TokenManager
//    {
//        // Session key to store user credentials
//        private static string SessionKey = "UserCredentials";

//        #region Token Storage in Session

//        /// <summary>
//        /// Add user credentials (email and password) to the session.
//        /// </summary>
//        public static void AddCredentialsToSession(HttpSessionState session, string email, string password)
//        {
//            var credentials = new { Email = email, Password = password };
//            session[SessionKey] = credentials;
//        }

//        /// <summary>
//        /// Get the user credentials (email and password) from the session.
//        /// </summary>
//        public static dynamic GetCredentialsFromSession(HttpSessionState session)
//        {
//            return session[SessionKey];
//        }

//        /// <summary>
//        /// Delete the user credentials from the session.
//        /// </summary>
//        public static void DeleteCredentialsFromSession(HttpSessionState session)
//        {
//            session.Remove(SessionKey);
//        }

//        #endregion

//        #region Credential Management

//        /// <summary>
//        /// Check if the user credentials exist in the session.
//        /// </summary>
//        public static bool CredentialsExistInSession(HttpSessionState session)
//        {
//            return session[SessionKey] != null;
//        }

//        /// <summary>
//        /// Update the user credentials in the session (replace with new credentials).
//        /// </summary>
//        public static void UpdateCredentialsInSession(HttpSessionState session, string newEmail, string newPassword)
//        {
//            var newCredentials = new { Email = newEmail, Password = newPassword };
//            session[SessionKey] = newCredentials;
//        }

//        #endregion
//    }
//}
