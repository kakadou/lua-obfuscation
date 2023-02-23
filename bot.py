# Gab1tzu
# Lua Obfuscation

import discord 
from discord.ext import commands
import os
import requests
from subprocess import check_output

bot = commands.Bot(command_prefix="!")
bot.remove_command("help")

file_path = os.path.abspath(os.path.dirname(__file__))

#blacklist system
def saveid(id):
    file = open(f"{file_path}//ids.txt")
    if(id in file.read()):
        print("present")
    else:
        f = open(f"{file_path}//ids.txt", 'a')
        f.write(f'\n{id}')
        f.close()

def isid(id):
    file = open(f"{file_path}//ids.txt") # the user ids that are in the ids.txt are blacklisted!
    if(id in file.read()):
        return False
    else:
        return True

def obfuscate(url):
    input_file = f'{file_path}//temp//input.lua'

    if os.path.exists(input_file):
        os.remove(input_file)

    file_data = requests.get(url).content
    with open(input_file, "wb") as file:
        file.write(file_data)

    p = check_output(['node', "D:\Amethyst\src\\run.js"]) # Change to your directory of the run.js file!

    x = "herrtt's obfuscator, v0.2.4" # Dont edit this!
    y = "your_watermark" # put your watermark here

    with open(f"{file_path}//temp//output-1.lua", 'r') as file :
        filedata = file.read()
    filedata = filedata.replace(x, y)
    with open(f"{file_path}//temp//output-1.lua", 'w') as file:
        file.write(filedata)

# Status of the bot
@bot.event
async def on_ready():
    print(f"{bot.user} is online ✔️")
    await bot.change_presence(status=discord.Status.online, activity=discord.Game(name="your_bot_status")) # place your bot status here

@bot.event
async def on_message(message: discord.Message):
    if message.guild is None and not message.author.bot:
        try:
            if isid(str(message.author.id)):
                if message.attachments:
                    if '.lua' not in message.attachments[0].url:
                        embed=discord.Embed(title=f"***Wrong file extension***", description=f"only .lua", color=0x0000ff) # Checks if the file is .lua
                        await message.channel.send(embed=embed)
 
                    else:
                        print(message.attachments[0].url) # logs deobfuscated scripts in console (remove if you dont want)
                        obfuscate(message.attachments[0].url)
                        embed=discord.Embed(title="Succesfully Obfuscated", color=0x3357FF)
                        await message.channel.send(embed=embed, file=discord.File(f"{file_path}//temp//output-1.lua")) # Sends Obfuscated script 
                else:
                    embed=discord.Embed(title=f"***Send me .lua file***", description=f"only ``.lua`` file attachment allowed", color=0xFF3357)
                    await message.channel.send(embed=embed) # Coming Soon
            else:
                    embed=discord.Embed(title=f"***BLACKLISTED***", description=f"YOU HAVE BEEN BLACKLISTED\n Blacklist expires: never", color=0xFF3357)
                    await message.channel.send(embed=embed)            # Blacklist message
        except:
            pass
        
bot.run("token") # Coded by gab1tzu
