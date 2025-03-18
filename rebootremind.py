import os
import time
import sys
import psutil
import winrt.windows.foundation.collections
from datetime import timedelta
from windows_toasts import WindowsToaster, Toast, ToastDisplayImage

# Get system uptime in days
boot_time = psutil.boot_time()
uptime_seconds = time.time() - boot_time
uptime_days = int(uptime_seconds // 86400)


if uptime_days >= 0:
    # Prepare uptime message
    UpTimeMsg = f"Your computer has been on for {uptime_days} days. Please restart at your earliest convenience."

    # Initialize toaster notification
    toaster = WindowsToaster("Reboot Reminder")

    # Create toast notification
    newToast = Toast()
    newToast.text_fields = ["Your computer needs a restart.", UpTimeMsg]
    newToast.launch_action = 'https://support.microsoft.com/en-us/windows/restart-reboot-your-pc-110262aa-fc79-1c33-7b00-c140ae3a6dac#:~:text=Go%20to%20Start%20%2C%20select%20the,button%2C%20and%20then%20select%20Restart%20.'

    # Set image (ensure path exists)
    image_path = r"C:\Program Files\rebootremind\HeroImage.png"
    if os.path.exists(image_path):
        newToast.AddImage(ToastDisplayImage.fromPath(image_path))

    # Show notification
    toaster.show_toast(newToast)
else:
    sys.exit()