import tkinter as tk
from tkinter import *
from tkinter import ttk
import subprocess
from PIL import Image, ImageTk


class ObjectGrid:
    def __init__(self, ffm):

        self.fm = ffm
        # self.splash_screen()
        self.myapp()
        root.title("Easy Backup WhatsApp by @hodifa_almosa   V2.0")
        root.geometry("600x600")

    splash_root = tk.Tk()
    splash_root.geometry('500x500')

    splash_root.title('Welcome To My App!!!')

    rrrright_image = tk.PhotoImage(file='tra.png')
    splash_label = tk.Label(splash_root, text='\nEasy Backup WhatsApp \n by @hodifa_almosa  \n V2.0 ',
                            image=rrrright_image, compound='top', font=('Arial', 18), fg='#0097e8')
    splash_label.pack(pady=75)

    splash_root.after(7000, splash_root.destroy)  # Close the splash screen after 3 seconds

    splash_root.mainloop()

    def myapp(self):

        # first frame
        options_with_fm = tk.Frame(fm)
        options_with_fm.pack(pady=5)
        options_with_fm.propagate(False)
        options_with_fm.configure(width=500, height=35)

        # btns in first frame
        home_btn = tk.Button(options_with_fm, text='Official WhatsApp', font=('Arial', 12), bd=0, fg='#0097e8',
                             activeforeground='#0097e8',
                             command=lambda: switch(indicator_lb=home_indicator_lb, page=home_page))
        home_btn.place(x=0, y=0, width=125)

        obwhatsapp_btn = tk.Button(options_with_fm, text='OB WhatsApp', font=('Arial', 12), bd=0, fg='#0097e8',
                                   activeforeground='#0097e8',
                                   command=lambda: switch(indicator_lb=obwhatsapp_indicator_lb, page=obwhatsapp_page))
        obwhatsapp_btn.place(x=125, y=0, width=125)

        instructions_btn = tk.Button(options_with_fm, text='Instructions',
                                     font=('Arial', 12),
                                     bd=0, fg='#0097e8', activeforeground='#0097e8',
                                     command=lambda: switch(indicator_lb=instructions_indicator_lb,
                                                            page=instructions_page))
        instructions_btn.place(x=250, y=0, width=125)

        about_btn = tk.Button(options_with_fm, text='About', font=('Arial', 13), bd=0, fg='#0097e8',
                              activeforeground='#0097e8',
                              command=lambda: switch(indicator_lb=about_indicator_lb, page=about_page))
        about_btn.place(x=375, y=0, width=125)

        # indicator for btns in first frame

        home_indicator_lb = tk.Label(options_with_fm, bg='#0097e8')
        home_indicator_lb.place(x=22, y=30, width=80, height=2)

        obwhatsapp_indicator_lb = tk.Label(options_with_fm, )
        obwhatsapp_indicator_lb.place(x=147, y=30, width=80, height=2)

        instructions_indicator_lb = tk.Label(options_with_fm, )
        instructions_indicator_lb.place(x=272, y=30, width=80, height=2)

        about_indicator_lb = tk.Label(options_with_fm, )
        about_indicator_lb.place(x=397, y=30, width=80, height=2)

        # second frame
        second_frame = tk.Frame(fm, bg='yellow', height=500, highlightthickness=3, highlightbackground='green',
                                width=300)
        second_frame.pack(pady=25, fill=BOTH, ipady=450, ipadx=120)

        # indictor hide and show
        def switch(indicator_lb, page):
            for child in options_with_fm.winfo_children():
                if isinstance(child, tk.Label):
                    child['bg'] = 'SystemButtonFace'
            indicator_lb['bg'] = '#0097e8'
            for fm in second_frame.winfo_children():
                fm.destroy()
                fm.update()

            page()

        # pages for btns in first frame
        def home_page():
            root.geometry("600x600")
            second_frame.pack(pady=25, fill=BOTH, ipady=450, ipadx=260)

            home_page_frame = tk.Frame(second_frame)
            home_page_frame.pack(expand=True, fill=BOTH)
            # left image

            image = Image.open("1.png")
            photo = ImageTk.PhotoImage(image)

            label = tk.Label(home_page_frame, image=photo, text="واتساب", compound='top')
            label.image = photo
            label.place(x=40, y=100)

            # left btns
            backup_button = ttk.Button(home_page_frame, text="نسخ احتياطي", command=wha_bkp)
            backup_button.place(x=25, y=250)
            restore_button = ttk.Button(home_page_frame, text='استعادة', command=wha_rst)
            restore_button.place(x=25, y=275)

            # left checkbox
            self.varleft = IntVar()
            self.lftchk = Checkbutton(home_page_frame, text="مع المحادثات", variable=self.varleft)
            self.lftchk.place(x=100, y=250)

            # right image

            self.right_image = tk.PhotoImage(file='2.png')
            self.python_image = tk.Label(home_page_frame, text="واتساب الأعمال", image=self.right_image, compound='top')
            self.python_image.place(x=350, y=100)

            # self.python_image.place(relx = 0.5 , rely= 0.5 , anchor = CENTER)
            # right btns

            self.backup_button_whab = ttk.Button(home_page_frame, text="نسخ احتياطي", command=whab_bkp)
            self.backup_button_whab.place(x=300, y=250)
            self.restore_button_whab = ttk.Button(home_page_frame, text='استعادة', command=whab_rst)
            self.restore_button_whab.place(x=300, y=275)
            # right checkbox
            self.varright_whab = IntVar()
            self.ritchk_whab = Checkbutton(home_page_frame, text="مع المحادثات", variable=self.varright_whab)
            self.ritchk_whab.place(x=390, y=250)

        def wha_bkp():
            if self.varleft.get():
                print('wha backup with media')
                subprocess.run([r"bin\bkpwmd.bat"])
            else:
                print('wha backup without media')
                subprocess.run([r"bin\bkp.bat"])

        def wha_rst():
            if self.varleft.get():
                print('wha reset with media')
                subprocess.run([r"bin\rstwmd.bat"])
            else:
                print('wha reset without media')
                subprocess.run([r"bin\rst.bat"])

        def whab_bkp():
            if self.varright_whab.get():
                print('whab backup with media')
                subprocess.run([r"bin\bkpwmdWHB.bat"])
            else:
                print('whab backup without media')
                # subprocess.run([r"bin\bkp.bat"])

        def whab_rst():
            if self.varright_whab.get():
                print('whab reset with media')
                subprocess.run([r"bin\rstwmdWHB.bat"])
            else:
                print('whab reset without media')
                # subprocess.run([r"bin\rst.bat"])

        home_page()  # call home page when app start after splash screen

        def obwhatsapp_page():
            second_frame.pack(pady=25, fill=BOTH, ipady=450, ipadx=250)
            root.geometry("1280x720")

            # second_frame.pack(pady=10, fill=BOTH, ipady=450, ipadx=120)

            obwhatsapp_page_frame = tk.Frame(second_frame)
            obwhatsapp_page_frame.pack(expand=True, fill=BOTH)
            # left image

            image = Image.open("obwh.png")
            photo = ImageTk.PhotoImage(image)

            label = tk.Label(obwhatsapp_page_frame, image=photo, text="العنابي", compound='top')
            label.image = photo
            label.place(x=40, y=5)

            # left btns
            backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", command=wha_bkp, state=tk.DISABLED)
            backup_button.place(x=25, y=145)
            restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', command=wha_rst, state=tk.DISABLED)
            restore_button.place(x=25, y=165)

            # left checkbox
            self.varleft = IntVar()
            self.lftchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=self.varleft)
            self.lftchk.place(x=100, y=145)

            # right image

            self.rright_image = tk.PhotoImage(file='obBlue.png')
            self.python_image = tk.Label(obwhatsapp_page_frame, text="الازرق", image=self.rright_image, compound='top')
            self.python_image.place(x=350, y=10)

            # self.python_image.place(relx = 0.5 , rely= 0.5 , anchor = CENTER)
            # right btns

            self.backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", state=tk.DISABLED)
            self.backup_button.place(x=300, y=150)
            self.restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', state=tk.DISABLED)
            self.restore_button.place(x=300, y=175)
            # right checkbox
            varright = IntVar()
            ritchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=varright)
            ritchk.place(x=390, y=150)

            # left image

            image = Image.open("obpink.png")
            photo = ImageTk.PhotoImage(image)

            label = tk.Label(obwhatsapp_page_frame, image=photo, text="الزهري", compound='top')
            label.image = photo
            label.place(x=40, y=210)

            # left btns
            backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", command=wha_bkp, state=tk.DISABLED)
            backup_button.place(x=25, y=340)
            restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', command=wha_rst, state=tk.DISABLED)
            restore_button.place(x=25, y=365)

            # left checkbox
            self.varleft = IntVar()
            self.lftchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=self.varleft)
            self.lftchk.place(x=100, y=340)

            # right image

            self.right_image = tk.PhotoImage(file='obgold.png')
            self.python_image = tk.Label(obwhatsapp_page_frame, text="الذهبي", image=self.right_image, compound='top')
            self.python_image.place(x=350, y=220)

            # self.python_image.place(relx = 0.5 , rely= 0.5 , anchor = CENTER)
            # right btns

            self.backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", state=tk.DISABLED)
            self.backup_button.place(x=300, y=350)
            self.restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', state=tk.DISABLED)
            self.restore_button.place(x=300, y=375)
            # right checkbox
            varright = IntVar()
            ritchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=varright)
            ritchk.place(x=390, y=350)

            # left image

            image = Image.open("obgreen.png")
            photo = ImageTk.PhotoImage(image)

            label = tk.Label(obwhatsapp_page_frame, image=photo, text="الاخضر", compound='top')
            label.image = photo
            label.place(x=40, y=400)

            # left btns
            backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", command=wha_bkp, state=tk.DISABLED)
            backup_button.place(x=25, y=530)
            restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', command=wha_rst, state=tk.DISABLED)
            restore_button.place(x=25, y=560)

            # left checkbox
            self.varleft = IntVar()
            self.lftchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=self.varleft)
            self.lftchk.place(x=100, y=530)

            # right image

            self.rrright_image = tk.PhotoImage(file='obred.png')
            self.python_image = tk.Label(obwhatsapp_page_frame, text="الأحمر", image=self.rrright_image, compound='top')
            self.python_image.place(x=350, y=400)

            # self.python_image.place(relx = 0.5 , rely= 0.5 , anchor = CENTER)
            # right btns

            self.backup_button = ttk.Button(obwhatsapp_page_frame, text="نسخ احتياطي", state=tk.DISABLED)
            self.backup_button.place(x=300, y=530)
            self.restore_button = ttk.Button(obwhatsapp_page_frame, text='استعادة', state=tk.DISABLED)
            self.restore_button.place(x=300, y=560)
            # right checkbox
            varright = IntVar()
            ritchk = Checkbutton(obwhatsapp_page_frame, text="مع المحادثات", variable=varright)
            ritchk.place(x=390, y=530)

        def instructions_page():
            root.geometry("800x720")

            instructions_page_frame = tk.Frame(second_frame)
            instructions_page_frame.pack(fill=tk.BOTH, expand=True)
            textfile = open('s.txt', 'r')
            stuff = textfile.read()
            instructions_page_lb = tk.Label(instructions_page_frame, text=stuff,
                                            font=('Arial', 14), fg='#0097e8')
            instructions_page_lb.pack()
            print(stuff)

        def about_page():
            root.geometry("800x500")
            second_frame.pack(pady=25, padx=25, ipady=300, ipadx=50)
            about_page_frame = tk.Frame(second_frame)
            about_page_frame.pack(fill=tk.BOTH, expand=True)
            about_page_lb = tk.Label(about_page_frame,
                                     text='Developed by @hodifa_almosa & @hamoud_almousa\n Version: 2.0'
                                          ' \n Follow my channel on Telegram: @hodifa_almosa',
                                     font=('Arial', 18), fg='#0097e8')
            about_page_lb.pack(pady=80)


# Example of creating the object grid
root = tk.Tk()
fm = tk.Frame(root)
fm.pack()

object_grid = ObjectGrid(fm)

fm.mainloop()
