const {group_channel} = require("../config.json")
module.exports = {
	name: 'group',
    description: 'Get a group role',
    args: true,
    guildOnly: true,
    usage: '<номер группы>',
	execute(message, args) {
        if (message.channel.id != group_channel) {return message.delete();}
        if (message.member.roles.cache.find(r => r.name.includes("Группа"))) {
            return message.reply("у вас не может быть более одной роли группы")
        }
        let role = message.guild.roles.cache.find(r => r.name === "Группа "+args[0]);
        if (!role) {
            return message.reply(`такой группы не существует`)
        }
        message.member.roles.add(role)
        role = message.guild.roles.cache.find(r => r.name === "Ученик")
		message.member.roles.add(role)
	},
};