<?php
// Detecta requisição AJAX
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
	header('Content-Type: application/json');

	$prompt = $_POST['prompt'] ?? '';
	$payload = json_encode([
		'prompt' => $prompt,
		'fonte' => '1'
	]);

	$ch = curl_init('http://localhost:3000/chat');
	curl_setopt_array($ch, [
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_POST => true,
		CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
		CURLOPT_POSTFIELDS => $payload,
		CURLOPT_VERBOSE => true
	]);

	$response = curl_exec($ch);
	curl_close($ch);

	$data = json_decode($response, true);
	echo json_encode([
		'resposta' => $data['resposta'] ?? 'Erro na API',
		'tokens' => $data['tokens']['total'] ?? 0,
		'custo' => $data['custo'] ?? 0,
	]);
	exit;
}

// Renderiza o template padrão (GET)
$PAGE_TITLE = "Chat";
