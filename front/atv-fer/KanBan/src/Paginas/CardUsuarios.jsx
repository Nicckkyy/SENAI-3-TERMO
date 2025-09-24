import React, { useState } from "react";
import { z } from "zod";
import "../styles/Cadastro.scss";

// Validação com Zod
const userSchema = z.object({
  nome: z.string().min(1, "O nome é obrigatório"),
  email: z.string().email("Email inválido"),
  senha: z.string().min(6, "A senha deve ter pelo menos 6 caracteres"),
});

export function CardUsuario() {
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [erro, setErro] = useState("");
  const [sucesso, setSucesso] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErro("");
    setSucesso("");

    const validation = userSchema.safeParse({ nome, email, senha });
    if (!validation.success) {
      setErro(validation.error.errors.map((err) => err.message).join(", "));
      return;
    }

    try {
      const response = await fetch("http://127.0.0.1:8000/api/cadastrar/", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nome, senha, email }),
      });

      if (response.ok) {
        setSucesso("Usuário cadastrado com sucesso!");
      } else {
        const errorData = await response.json();
        setErro(errorData.detail || "Erro ao cadastrar usuário");
      }
    } catch {
      setErro("Erro de rede ou servidor");
    }
  };

  return (
    <section className="formulario" aria-labelledby="titulo-usuario">
      <h2 id="titulo-usuario" className="titulo">
        Cadastro de Usuário
      </h2>

      {erro && (
        <p className="erro" role="alert">
          {erro}
        </p>
      )}
      {sucesso && <p className="sucesso">{sucesso}</p>}

      <form onSubmit={handleSubmit} aria-describedby="titulo-usuario">
        <label htmlFor="nome">Nome:</label>
        <input
          id="nome"
          type="text"
          value={nome}
          onChange={(e) => setNome(e.target.value)}
          required
        />

        <label htmlFor="email">Email:</label>
        <input
          id="email"
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />

        <label htmlFor="senha">Senha:</label>
        <input
          id="senha"
          type="password"
          value={senha}
          onChange={(e) => setSenha(e.target.value)}
          required
        />

        <button type="submit">Cadastrar</button>
      </form>
    </section>
  );
}
