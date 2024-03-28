using System.Net.Mail;
using System.Net;

namespace CarChoice.BAL
{
    public class EmailSender : IEmailSender
    {
        private readonly string _smtpServer;
        private readonly int _smtpPort;
        private readonly string _smtpUsername;
        private readonly string _smtpPassword;


        public EmailSender(string smtpServer, int smtpPort, string smtpUsername, string smtpPassword)
        {
            _smtpServer = smtpServer;
            _smtpPort = smtpPort;
            _smtpUsername = smtpUsername;
            _smtpPassword = smtpPassword;
        }


        public async Task SendEmailAsync(string Email, string subject, string message)
        {
            using (var smtpClient = new SmtpClient(_smtpServer))
            {
                smtpClient.Port = _smtpPort;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(_smtpUsername, _smtpPassword);
                smtpClient.EnableSsl = true;

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(_smtpUsername),
                    Subject = subject,
                    Body = message,
                    IsBodyHtml = true
                };

                mailMessage.To.Add(Email);

                await smtpClient.SendMailAsync(mailMessage);
            }
        }
    }


}

