async function runAI() {
  const apiKey = document.getElementById('apiKey').value;
  const prompt = document.getElementById('promptInput').value;
  const text = document.getElementById('textInput').value;

  const fullPrompt = `
Role: Professional Business Editor
${prompt}

Text:
${text}
`;

  try {
    const res = await fetch("https://api.ollama.com/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${apiKey}`
      },
      body: JSON.stringify({
        model: "llama3",
        messages: [
          { role: "system", content: "You are a professional business editor." },
          { role: "user", content: fullPrompt }
        ]
      })
    });

    const data = await res.json();
    document.getElementById("output").textContent =
      data.choices?.[0]?.message?.content || "응답 없음";

  } catch (e) {
    document.getElementById("output").textContent = "에러: " + e.message;
  }
}