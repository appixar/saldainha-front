<!-- Main Content Wrapper -->
<main x-data="{isShowChatInfo : !$store.breakpoints.mdAndDown ,activeChat:{chatId:'chat-1',name:'SALDANHINHA',avatar_url:'/assets/template/images/robozinho.png'}}" x-effect="$store.breakpoints.mdAndDown === true &amp;&amp; (isShowChatInfo = false)" class="main-content h-100vh chat-app mt-0 flex w-full flex-col" :class="isShowChatInfo &amp;&amp; 'lg:mr-80'" @change-active-chat.window="activeChat=$event.detail">
	<div class="chat-header relative z-10 flex h-[61px] w-full shrink-0 items-center justify-between border-b border-slate-150 bg-white px-[calc(var(--margin-x)-.5rem)] shadow-sm transition-[padding,width] duration-[.25s] dark:border-navy-700 dark:bg-navy-800">
		<div class="flex items-center space-x-5">
			<div @click="isShowChatInfo = true" class="flex cursor-pointer items-center space-x-4 font-inter">
				<div class="avatar">
					<img class="rounded-full" src="/assets/template/images/robozinho.png" :src="activeChat.avatar_url" alt="avatar">
				</div>
				<div>
					<p class="font-larger text-slate-700 line-clamp-1 dark:text-navy-100" x-text="activeChat.name">SALDANHINHA</p>
					<!-- <p class="mt-0.5 text-xs">Last seen recently</p> -->
				</div>
			</div>
		</div>
		<div class="-mr-1 flex items-center">
			<button @click="isShowChatInfo = !isShowChatInfo" :class="isShowChatInfo ? 'text-primary dark:text-accent-light' : 'text-slate-500 dark:text-navy-200'" class="btn hidden h-9 w-9 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 sm:flex text-slate-500 dark:text-navy-200">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-5.5 w-5.5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" d="M9.25 21.167h5.5c4.584 0 6.417-1.834 6.417-6.417v-5.5c0-4.583-1.834-6.417-6.417-6.417h-5.5c-4.583 0-6.417 1.834-6.417 6.417v5.5c0 4.583 1.834 6.417 6.417 6.417ZM13.834 2.833v18.334"></path>
				</svg>
			</button>
			<!-- <div x-data="usePopper({placement:'bottom-end',offset:4})" @click.outside="isShowPopper &amp;&amp; (isShowPopper = false)" class="inline-flex">
				<button x-ref="popperRef" @click="isShowPopper = !isShowPopper" class="btn h-9 w-9 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-5.5 w-5.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
						<path stroke-linecap="round" stroke-linejoin="round" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
					</svg>
				</button>

				<div x-ref="popperRoot" class="popper-root" :class="isShowPopper &amp;&amp; 'show'" style="position: fixed; inset: 0px 0px auto auto; margin: 0px; transform: translate(-12px, 52px);" data-popper-placement="bottom-end">
					<div class="popper-box rounded-md border border-slate-150 bg-white py-1.5 font-inter dark:border-navy-500 dark:bg-navy-700">
						<ul>
							<li>
								<a href="apps-chat.html#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
									<svg xmlns="http://www.w3.org/2000/svg" class="mt-px h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
										<path stroke-linecap="round" stroke-linejoin="round" d="M5.586 15H4a1 1 0 01-1-1v-4a1 1 0 011-1h1.586l4.707-4.707C10.923 3.663 12 4.109 12 5v14c0 .891-1.077 1.337-1.707.707L5.586 15z" clip-rule="evenodd"></path>
										<path stroke-linecap="round" stroke-linejoin="round" d="M17 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2"></path>
									</svg>
									<span>Unmute</span></a>
							</li>
							<li>
								<a href="apps-chat.html#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
									<svg xmlns="http://www.w3.org/2000/svg" class="mt-px h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
										<path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
										<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
									</svg>
									<span>Chat Setting</span></a>
							</li>
							<li>
								<a href="apps-chat.html#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide outline-none transition-all hover:bg-slate-100 hover:text-slate-800 focus:bg-slate-100 focus:text-slate-800 dark:hover:bg-navy-600 dark:hover:text-navy-100 dark:focus:bg-navy-600 dark:focus:text-navy-100">
									<svg xmlns="http://www.w3.org/2000/svg" class="mt-px h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
										<path stroke-linecap="round" stroke-linejoin="round" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
									</svg>
									<span>Block User</span></a>
							</li>
							<li>
								<a href="apps-chat.html#" class="flex h-8 items-center space-x-3 px-3 pr-8 font-medium tracking-wide text-error outline-none transition-all hover:bg-error/20 focus:bg-error/20">
									<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
										<path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
									</svg>
									<span> Delete chat</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div> -->
		</div>
	</div>

	<div :class="$store.breakpoints.smAndUp &amp;&amp; 'scrollbar-sm'" class="grow overflow-y-auto px-[calc(var(--margin-x)-.5rem)] py-5 transition-all duration-[.25s] scrollbar-sm">
		<div x-show="activeChat.chatId === 'chat-1'" x-transition:enter="transition-all duration-500 easy-in-out" x-transition:enter-start="opacity-0 [transform:translate3d(0,1rem,0)]" x-transition:enter-end="opacity-100 [transform:translate3d(0,0,0)]" class="space-y-5">
			<div class="mx-4 flex items-center space-x-3">
				&nbsp;
			</div>

			<div id="interactions"></div>

			
			<!-- <div class="flex items-start space-x-2.5 sm:space-x-5">
				<div class="avatar">
					<img class="rounded-full" src="images/avatar/avatar-19.jpg" :src="activeChat.avatar_url" alt="avatar">
				</div>

				<div class="flex flex-col items-start space-y-3.5">
					<div class="mr-4 max-w-lg sm:mr-10">
						<div class="rounded-2xl rounded-tl-none bg-white p-3 text-slate-700 shadow-sm dark:bg-navy-700 dark:text-navy-100">
							Hello My Dear. Lorem ipsum dolor sit amet, consectetur.
						</div>
						<p class="mt-1 ml-auto text-right text-xs text-slate-400 dark:text-navy-300">
							08:16
						</p>
					</div>
				</div>
			</div>

			<div class="flex items-start justify-end space-x-2.5 sm:space-x-5">
				<div class="flex flex-col items-end space-y-3.5">
					<div class="ml-4 max-w-lg sm:ml-10">
						<div class="rounded-2xl rounded-tr-none bg-info/10 p-3 text-slate-700 shadow-sm dark:bg-accent dark:text-white">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Assumenda necessitatibus, ratione. Voluptatum.
						</div>
					</div>
					<div class="ml-4 max-w-lg sm:ml-10">
						<div class="rounded-2xl rounded-tr-none bg-info/10 p-3 text-slate-700 shadow-sm dark:bg-accent dark:text-white">
							And that’s why a 15th century
						</div>
						<p class="mt-1 ml-auto text-left text-xs text-slate-400 dark:text-navy-300">
							08:16
						</p>
					</div>
				</div>
			</div>

			<div class="flex items-start space-x-2.5 sm:space-x-5">
				<div class="avatar">
					<img class="rounded-full" src="images/avatar/avatar-19.jpg" :src="activeChat.avatar_url" alt="avatar">
				</div>

				<div class="flex flex-col items-start space-y-3.5">
					<div class="mr-4 max-w-lg sm:mr-10">
						<div class="rounded-2xl rounded-tl-none bg-white p-3 text-slate-700 shadow-sm dark:bg-navy-700 dark:text-navy-100">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Eius. Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Eius. Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Eius. Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Eius.
						</div>
						<p class="mt-1 ml-auto text-right text-xs text-slate-400 dark:text-navy-300">
							08:16
						</p>
					</div>
				</div>
			</div>

			<div class="flex items-start justify-end space-x-2.5 sm:space-x-5">
				<div class="flex flex-col items-end space-y-3.5">
					<div class="ml-4 max-w-lg sm:ml-10">
						<div class="rounded-2xl rounded-tr-none bg-info/10 p-3 text-slate-700 shadow-sm dark:bg-accent dark:text-white">
							Please Download This File. Please Download This File. Please Download This File. Please Download This File. Please Download This File. Please Download This File. Please Download This File. Please Download This File. 
						</div>
						<p class="mt-1 ml-auto text-left text-xs text-slate-400 dark:text-navy-300">
							08:16
						</p>
					</div>
				</div>
			</div> -->
		</div>
	</div>

	<div class="chat-footer relative flex h-12 w-full shrink-0 items-center justify-between border-t border-slate-150 bg-white px-[calc(var(--margin-x)-.25rem)] transition-[padding,width] duration-[.25s] dark:border-navy-600 dark:bg-navy-800">
		<div class="-ml-1.5 flex flex-1 space-x-2">
			<input disabled name="message_ia" type="text" class="form-input h-9 w-full bg-transparent placeholder:text-slate-400/70" placeholder="Escreva aqui sua dúvida...">
		</div>

		<div class="-mr-1.5 flex">
			<button disabled id="sendMessage" class="btn h-9 w-9 shrink-0 rounded-full p-0 text-primary hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:text-accent-light dark:hover:bg-accent-light/20 dark:focus:bg-accent-light/20 dark:active:bg-accent-light/25">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-5.5 w-5.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
					<path stroke-linecap="round" stroke-linejoin="round" d="m9.813 5.146 9.027 3.99c4.05 1.79 4.05 4.718 0 6.508l-9.027 3.99c-6.074 2.686-8.553.485-5.515-4.876l.917-1.613c.232-.41.232-1.09 0-1.5l-.917-1.623C1.26 4.66 3.749 2.46 9.813 5.146ZM6.094 12.389h7.341"></path>
				</svg>
			</button>
		</div>
	</div>

	<template x-teleport="#x-teleport-target">
		<div x-data="{
            get showDrawer() {return $data.isShowChatInfo;},
            set showDrawer(val) {$data.isShowChatInfo = val;},
          }" x-show="showDrawer" @keydown.window.escape="showDrawer = false">
			<div class="fixed inset-0 z-[100] bg-slate-900/60 transition-opacity duration-200" @click="showDrawer = false" x-show="showDrawer &amp;&amp; $store.breakpoints.mdAndDown" x-transition:enter="ease-out" x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100" x-transition:leave="ease-in" x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"></div>
			<div class="fixed right-0 top-0 z-[101] h-full w-full sm:w-80">
				<div class="flex h-full w-full flex-col border-l border-slate-150 bg-white transition-transform duration-200 dark:border-navy-600 dark:bg-navy-750" x-show="showDrawer" x-transition:enter="ease-out transform-gpu" x-transition:enter-start="translate-x-full" x-transition:enter-end="translate-x-0" x-transition:leave="ease-in transform-gpu" x-transition:leave-start="translate-x-0" x-transition:leave-end="translate-x-full">
					<div class="flex h-[60px] items-center justify-between p-4">
						<h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
							Chat Info
						</h3>
						<div class="-mr-1.5 flex space-x-1">
							<button @click="$store.global.isDarkModeEnabled = !$store.global.isDarkModeEnabled" class="btn h-8 w-8 rounded-full p-0 hover:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:active:bg-navy-300/25">
								<svg x-show="$store.global.isDarkModeEnabled" x-transition:enter="transition-transform duration-200 ease-out absolute origin-top" x-transition:enter-start="scale-75" x-transition:enter-end="scale-100 static" class="h-6 w-6 text-amber-400" fill="currentColor" viewBox="0 0 24 24">
									<path d="M11.75 3.412a.818.818 0 01-.07.917 6.332 6.332 0 00-1.4 3.971c0 3.564 2.98 6.494 6.706 6.494a6.86 6.86 0 002.856-.617.818.818 0 011.1 1.047C19.593 18.614 16.218 21 12.283 21 7.18 21 3 16.973 3 11.956c0-4.563 3.46-8.31 7.925-8.948a.818.818 0 01.826.404z"></path>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" x-show="!$store.global.isDarkModeEnabled" x-transition:enter="transition-transform duration-200 ease-out absolute origin-top" x-transition:enter-start="scale-75" x-transition:enter-end="scale-100 static" class="h-6 w-6 text-amber-400" viewBox="0 0 20 20" fill="currentColor">
									<path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
								</svg>
							</button>

							<button @click="showDrawer=false" class="btn h-8 w-8 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
									<path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"></path>
								</svg>
							</button>
						</div>
					</div>
					<div class="mt-5 flex flex-col items-center">
						<div class="avatar h-20 w-20">
							<img class="rounded-full" src="https://lineone.piniastudio.com/null" :src="activeChat.avatar_url" alt="avatar">
						</div>
						<h3 x-text="activeChat.name" class="mt-2 text-lg font-medium text-slate-700 dark:text-navy-100"></h3>
						<p>Agente IA</p>
					</div>
				</div>
			</div>
		</div>
	</template>
</main>