<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/assets/js/chat.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		const input = document.querySelector('input[name="prompt"]');
		const chatFooter = document.querySelector('.chat-footer');
		const chatContainer = document.querySelector('.grow');
		const sendBtn = chatFooter.querySelector('button:last-of-type');

		sendBtn.addEventListener('click', async function() {
			const userMessage = input.value.trim();
			if (!userMessage) return;

			// Adiciona mensagem do usuário no DOM
			const userHTML = `
				<div class="flex justify-end">
					<div class="bg-info/10 dark:bg-accent text-white rounded-2xl rounded-tr-none p-3 m-2 max-w-lg">
						${userMessage}
					</div>
				</div>
			`;
			chatContainer.insertAdjacentHTML('beforeend', userHTML);
			input.value = '';

			const formData = new FormData();
			formData.append('prompt', userMessage);

			const res = await fetch('/chat.php', {
				method: 'POST',
				headers: {
					'X-Requested-With': 'XMLHttpRequest'
				},
				body: formData
			});
			const data = await res.json();

			const respostaHTML = `
				<div class="flex justify-start">
					<div class="bg-white dark:bg-navy-700 text-slate-700 dark:text-navy-100 rounded-2xl rounded-tl-none p-3 m-2 max-w-lg">
						${data.resposta}
					</div>
				</div>
			`;
			chatContainer.insertAdjacentHTML('beforeend', respostaHTML);

			// Scroll automático
			chatContainer.scrollTop = chatContainer.scrollHeight;
		});
	});
</script>