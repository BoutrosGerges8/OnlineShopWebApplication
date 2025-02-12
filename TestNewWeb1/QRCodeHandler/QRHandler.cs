using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using QRCoder;


namespace TestNewWeb1.QRCodeHanlder
{

    public class QRHandler
    {
        /// <summary>
        /// Generates a QR Code and saves it as a PNG file.
        /// </summary>
        /// <param name="text">The text or URL to encode.</param>
        /// <param name="filePath">The file path to save the QR code image.</param>
        /// <param name="pixelsPerModule">Size of each QR pixel (default: 10).</param>
        public static void GenerateQRCodeToFile(string text, string filePath, int pixelsPerModule = 10)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    Bitmap qrImage = qrCode.GetGraphic(pixelsPerModule);
                    qrImage.Save(filePath, ImageFormat.Png);
                }
            }
        }

        /// <summary>
        /// Generates a QR Code and returns it as a Base64 string.
        /// </summary>
        /// <param name="text">The text or URL to encode.</param>
        /// <param name="pixelsPerModule">Size of each QR pixel (default: 10).</param>
        /// <returns>Base64 string of the QR code.</returns>
        public static string GenerateQRCodeAsBase64(string text, int pixelsPerModule = 10)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        qrCode.GetGraphic(pixelsPerModule).Save(ms, ImageFormat.Png);
                        return "data:image/png;base64," + Convert.ToBase64String(ms.ToArray());
                    }
                }
            }
        }
    }

}