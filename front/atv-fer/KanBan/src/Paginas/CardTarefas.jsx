// src/Paginas/CardTarefas.jsx

import React, { useState } from "react";
import { z } from "zod";

const tarefaSchema = z.object({
  descricao: z.string().min(1, "A descrição é obrigatória"),
  setor: z.string().min(1, "O setor é obrigatório"),
  prioridade: z.enum(["baixa", "media", "alta"], {
    errorMap: () => ({ message: "Selecione uma prioridade válida" }),
  }),
});

// Altere o nome da função de exportação para CardTarefas
export function CardTarefas() {
  const [descricao, setDescricao] = useState("");
  const [setor, setSetor] = useState("");
  const [prioridade, setPrioridade] = useState("media");
  const [erro, setErro] = useState("");
  const [sucesso, setSucesso] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErro("");
    setSucesso("");

    const validation = tarefaSchema.safeParse({ descricao, setor, prioridade });
    if (!validation.success) {
      setErro(validation.error.errors.map((err) => err.message).join(", "));
      return;
    }

    try {
      const response = await fetch("http://127.0.0.1:8000/api/tarefas/", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ descricao, setor, prioridade, status: "fazer" }),
      });

      if (response.ok) {
        setSucesso("Tarefa cadastrada com sucesso!");
      } else {
        const errorData = await response.json();
        setErro(errorData.detail || "Erro ao cadastrar tarefa");
      }
    } catch {
      setErro("Erro de rede ou servidor");
    }
  };

  return (
    <section className="formulario" aria-labelledby="titulo-tarefa">
      <h2 id="titulo-tarefa" className="titulo">
        Cadastro de Tarefa
      </h2>

      {erro && (
        <p className="erro" role="alert">
          {erro}
        </p>
      )}
      {sucesso && <p className="sucesso">{sucesso}</p>}

      <form onSubmit={handleSubmit} aria-describedby="titulo-tarefa">
        <label htmlFor="descricao">Descrição:</label>
        <input
          id="descricao"
          type="text"
          value={descricao}
          onChange={(e) => setDescricao(e.target.value)}
          required
        />

        <label htmlFor="setor">Setor:</label>
        <input
          id="setor"
          type="text"
          value={setor}
          onChange={(e) => setSetor(e.target.value)}
          required
        />

        <label htmlFor="prioridade">Prioridade:</label>
        <select
          id="prioridade"
          value={prioridade}
          onChange={(e) => setPrioridade(e.target.value)}
          required
        >
          <option value="baixa">Baixa</option>
          <option value="media">Média</option>
          <option value="alta">Alta</option>
        </select>

        <button type="submit">Cadastrar</button>
      </form>
    </section>
  );
}
