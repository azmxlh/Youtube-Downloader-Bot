from pyrogram import Client, filters, StopPropagation, InlineKeyboardButton, InlineKeyboardMarkup


@Client.on_message(filters.command(["start"]), group=-2)
async def start(client, message):
    # return
    joinButton = InlineKeyboardMarkup([
        [InlineKeyboardButton("Channel", url="https://t.me/TG_Status_World")],
        [InlineKeyboardButton(
            "Owner", url="https://t.me/M_I_S_H_I_H_A")]
    ])
    welcomed = f"Hey <b>{message.from_user.first_name}</b>\n/help for More info"
    await message.reply_text(welcomed, reply_markup=joinButton)
    raise StopPropagation
