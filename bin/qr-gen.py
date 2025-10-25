# /// script
# dependencies = [
#   "qrcode",
#   "Pillow"
# ]
# ///

import qrcode
link = input("Link: ")

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=10,
    border=4,
)

qr.add_data(link)
qr.make(fit=True)

img = qr.make_image(fill_color="black", back_color="white")

file_name = input("File name: ")
img.save(file_name)

print(f"Successfully generated QR code and saved it as '{file_name}'")
