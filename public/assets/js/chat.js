let processing = false;

$('#sendMessage').click(async function () {
    var message = $('[name="message_ia"]').val()
    if (!message.trim()) return;

    if(processing) return;

    processing = true;

    var hour = getCurrentHour();

    var meTemplateMessage = `
        <div class="flex items-start justify-end space-x-2.5 sm:space-x-5" style="margin-bottom: 15px;">
			<div class="flex flex-col items-end space-y-3.5">
				<div class="ml-4 max-w-lg sm:ml-10">
					<div class="rounded-2xl rounded-tr-none bg-info/10 p-3 text-slate-700 shadow-sm dark:bg-accent dark:text-white">
                        ${message}
					</div>
					<p class="mt-1 ml-auto text-left text-xs text-slate-400 dark:text-navy-300">
						${hour}
					</p>
				</div>
			</div>
		</div>
    `;

    $('#interactions').append(meTemplateMessage)
    $('[name="message_ia"]').val('')

    setTimeout(async () => {
        addSALDANHINHALoader()
    
        const formData = new FormData();
        formData.append('prompt', message.trim());
    
        const res = await fetch('/chat', {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            },
            body: formData
        });
    
        const data = await res.json();
    
        console.log(data)

        var hour = getCurrentHour();
        if(data.resposta) {
            var msgWelcome = botMessageTemplate.replace('{{message}}', data.resposta)
                msgWelcome = msgWelcome.replace('{{hour}}', hour)
            $('#interactions').append(msgWelcome)
        } else {
            var msgWelcome = botMessageTemplate.replace('{{message}}', 'Infelizmente não conseguimos processar sua pergunta neste momento. Tente novamente mais tarde.')
                msgWelcome = msgWelcome.replace('{{hour}}', hour)
            $('#interactions').append(msgWelcome)
        }
        
        processing = false
        rmSALDANHINHALoader()
    }, 400);
});

$('[name="message_ia"]').keyup(function () {
    var message = $('[name="message_ia"]').val()
    if (!message) {
        $('#sendMessage').attr('disabled', 'disabled');
    } else {
        $('#sendMessage').removeAttr('disabled');
    }
});

$(document).ready(function() {
    addSALDANHINHALoader()
    var hour = getCurrentHour();

    setTimeout(() => {
        var msgWelcome = botMessageTemplate.replace('{{message}}', 'Bem vindo(a), sou o SALDANHINHA, Assistente de IA do Saldanha Invest. Em que posso ajudar?')
            msgWelcome = msgWelcome.replace('{{hour}}', hour)
    
        $('#interactions').append(msgWelcome)
        $('[name="message_ia"]').removeAttr('disabled')
        rmSALDANHINHALoader()
    }, 2000);
});

$(document).on('keydown', function(event) {
    if (event.key === 'Enter') {
        $('#sendMessage').click();
    }
});

var botMessageTemplate = `
    <div class="flex items-start space-x-2.5 sm:space-x-5">
		<div class="avatar">
			<img class="rounded-full" src="/assets/template/images/robozinho.png" :src="activeChat.avatar_url" alt="avatar">
		</div>
		<div class="flex flex-col items-start space-y-3.5">
			<div class="mr-4 max-w-lg sm:mr-10">
				<div class="rounded-2xl rounded-tl-none bg-white p-3 text-slate-700 shadow-sm dark:bg-navy-700 dark:text-navy-100">
					{{message}}
				</div>
				<p class="mt-1 ml-auto text-right text-xs text-slate-400 dark:text-navy-300">
					{{hour}}
				</p>
			</div>
		</div>
	</div>
`;

var botLoaderTemplate = `
    <div class="flex items-start space-x-2.5 sm:space-x-5 SALDANHINHA_loader">
		<div class="avatar">
			<img class="rounded-full" src="/assets/template/images/robozinho.png" :src="activeChat.avatar_url" alt="avatar">
		</div>
		<div class="flex flex-col items-start space-y-3.5">
			<div class="mr-4 max-w-lg sm:mr-10">
				<div class="rounded-2xl rounded-tl-none bg-white p-3 text-slate-700 shadow-sm dark:bg-navy-700 dark:text-navy-100">
					<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
				</div>
				<p class="mt-1 ml-auto text-right text-xs text-slate-400 dark:text-navy-300">
					&nbsp;
				</p>
			</div>
		</div>
	</div>
`;

function addSALDANHINHALoader() {
    $('#interactions').append(botLoaderTemplate)
}

function rmSALDANHINHALoader() {
    $('.SALDANHINHA_loader').remove()
}

function getCurrentHour() {
    const agora = new Date();
    const hora = String(agora.getHours()).padStart(2, '0');
    const minuto = String(agora.getMinutes()).padStart(2, '0');

    return `${hora}:${minuto}`;
}