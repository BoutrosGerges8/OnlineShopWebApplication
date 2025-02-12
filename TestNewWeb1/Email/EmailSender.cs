using System;
using System.Net;
using System.Net.Mail;

namespace TestNewWeb1
{
    public class EmailSender
    {
        private string _smtpServer;
        private int _smtpPort;
        private string _email;
        private string _password;

        public EmailSender(string smtpServer, int smtpPort, string email, string password)
        {
            _smtpServer = smtpServer;
            _smtpPort = smtpPort;
            _email = "zor.aila.r.nua.be@gmail.com";
            _password = "";
        }

        /// <summary>
        /// Sends an email.
        /// </summary>
        /// <param name="toEmail">Recipient Email</param>
        /// <param name="subject">Email Subject</param>
        /// <param name="body">Email Body</param>
        /// <returns>True if email sent successfully, False otherwise</returns>
        public bool SendEmail(string toEmail, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(_email);
                mail.To.Add(toEmail);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient(_smtpServer, _smtpPort)
                {
                    Credentials = new NetworkCredential(_email, _password),
                    EnableSsl = true
                };

                smtp.Send(mail);
                return true; // Email sent successfully
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sending email: " + ex.Message);
                return false; // Failed to send email
            }
        }
    }
}
