using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.SessionState;

namespace TestNewWeb1
{
    public class TokenManager
    {
        // Session key to store user credentials.
        private static string SessionKey = "UserCredentials";
        // Encryption key (must be exactly 32 characters for AES-256).
        private static string EncryptionKey = "YourEncryptionKeyMustBe32Chars!!";

        #region Encryption/Decryption Methods

        /// <summary>
        /// Encrypts the given plain text using AES encryption.
        /// </summary>
        private static string EncryptString(string text)
        {
            using (Aes aes = Aes.Create())
            {
                // Set the key and generate a new IV.
                aes.Key = Encoding.UTF8.GetBytes(EncryptionKey);
                aes.GenerateIV();

                using (var encryptor = aes.CreateEncryptor(aes.Key, aes.IV))
                using (var ms = new MemoryStream())
                {
                    // Prepend the IV to the output.
                    ms.Write(aes.IV, 0, aes.IV.Length);
                    using (var cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    using (var writer = new StreamWriter(cs))
                    {
                        writer.Write(text);
                    }
                    // Return the complete encrypted payload as a Base64 string.
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
        }

        /// <summary>
        /// Decrypts the given encrypted text (Base64 encoded) using AES decryption.
        /// </summary>
        private static string DecryptString(string cipherText)
        {
            byte[] buffer = Convert.FromBase64String(cipherText);
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(EncryptionKey);
                int ivLength = aes.BlockSize / 8; // Calculate IV length in bytes.
                byte[] iv = new byte[ivLength];
                Array.Copy(buffer, iv, iv.Length);
                aes.IV = iv;

                using (var decryptor = aes.CreateDecryptor(aes.Key, aes.IV))
                using (var ms = new MemoryStream(buffer, ivLength, buffer.Length - ivLength))
                using (var cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                using (var reader = new StreamReader(cs))
                {
                    return reader.ReadToEnd();
                }
            }
        }

        #endregion

        #region Token Storage in Session

        /// <summary>
        /// Add user credentials (email, password, user ID, and isAdmin) to the session.
        /// The email and password are encrypted.
        /// </summary>
        public static void AddCredentialsToSession(HttpSessionState session, string email, string password, int userId, bool isAdmin = false)
        {
            var credentials = new
            {
                Email = EncryptString(email),
                Password = EncryptString(password),
                UserId = userId,
                IsAdmin = isAdmin
            };
            session[SessionKey] = credentials;
        }

        /// <summary>
        /// Get the user credentials (email, password, user ID, and isAdmin) from the session.
        /// The email and password are decrypted before returning.
        /// </summary>
        public static dynamic GetCredentialsFromSession(HttpSessionState session)
        {
            // Cast the session object to dynamic to access its properties.
            dynamic credentials = session[SessionKey];
            if (credentials != null)
            {
                try
                {
                    return new
                    {
                        Email = DecryptString((string)credentials.Email),
                        Password = DecryptString((string)credentials.Password),
                        UserId = credentials.UserId,
                        IsAdmin = credentials.IsAdmin
                    };
                }
                catch
                {
                    // If decryption fails, return null or handle the error as needed.
                    return null;
                }
            }
            return null;
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
        /// The new email and password are encrypted.
        /// </summary>
        public static void UpdateCredentialsInSession(HttpSessionState session, string newEmail, string newPassword, int newUserId, bool newIsAdmin)
        {
            var newCredentials = new
            {
                Email = EncryptString(newEmail),
                Password = EncryptString(newPassword),
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
            return credentials != null ? credentials.UserId : 0; // Return 0 if not available.
        }

        /// <summary>
        /// Check if the user is an admin based on session data.
        /// </summary>
        public static bool IsUserAdmin(HttpSessionState session)
        {
            var credentials = GetCredentialsFromSession(session);
            return credentials != null && credentials.IsAdmin; // Defaults to false if not available.
        }

        /// <summary>
        /// Check if the user is already logged in by checking if credentials exist in the session.
        /// </summary>
        public static bool IsLoggedInAlready(HttpSessionState session)
        {
            return CredentialsExistInSession(session);
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
//        /// Add user credentials (email, password, user ID, and isAdmin) to the session.
//        /// </summary>
//        public static void AddCredentialsToSession(HttpSessionState session, string email, string password, int userId, bool isAdmin = false)
//        {
//            var credentials = new
//            {
//                Email = email,
//                Password = password,
//                UserId = userId,
//                IsAdmin = isAdmin
//            };
//            session[SessionKey] = credentials;
//        }

//        /// <summary>
//        /// Get the user credentials (email, password, user ID, and isAdmin) from the session.
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
//        public static void UpdateCredentialsInSession(HttpSessionState session, string newEmail, string newPassword, int newUserId, bool newIsAdmin)
//        {
//            var newCredentials = new
//            {
//                Email = newEmail,
//                Password = newPassword,
//                UserId = newUserId,
//                IsAdmin = newIsAdmin
//            };
//            session[SessionKey] = newCredentials;
//        }

//        #endregion

//        #region Utility Methods

//        /// <summary>
//        /// Get the User ID from session.
//        /// </summary>
//        public static int GetUserIdFromSession(HttpSessionState session)
//        {
//            var credentials = GetCredentialsFromSession(session);
//            return credentials != null ? credentials.UserId : 0; // Return 0 if not available
//        }

//        /// <summary>
//        /// Check if the user is an admin based on session data.
//        /// </summary>
//        public static bool IsUserAdmin(HttpSessionState session)
//        {
//            var credentials = GetCredentialsFromSession(session);
//            return credentials != null && credentials.IsAdmin; // Default to false if not available
//        }

//        /// <summary>
//        /// Check if the user is already logged in by checking if credentials exist in the session.
//        /// </summary>
//        public static bool IsLoggedInAlready(HttpSessionState session)
//        {
//            return CredentialsExistInSession(session); // Check if user credentials exist in session
//        }

//        #endregion
//    }
//}




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
