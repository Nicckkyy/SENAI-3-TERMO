import React, { useState, useEffect } from "react";
import Coluna from "./Coluna";
import "../styles/Quadro.scss";

export default function Quadro() {
  const [tarefas, setTarefas] = useState([]);
  const [erro, setErro] = useState("");

  const fetchTarefas = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/api/tarefas/");
      if (response.ok) {
        const data = await response.json();
        setTarefas(data);
      } else {
        setErro("Erro ao carregar as tarefas");
      }
    } catch (error) {
      setErro("Erro de rede ou servidor");
    }
  };

  useEffect(() => {
    fetchTarefas();
  }, []);

  const atualizarStatusTarefa = async (id, novoStatus) => {
    try {
      const response = await fetch(`http://127.0.0.1:8000/api/tarefas/${id}/`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: novoStatus }),
      });

      if (response.ok) {
        setTarefas((prevTarefas) =>
          prevTarefas.map((tarefa) =>
            tarefa.id === id ? { ...tarefa, status: novoStatus } : tarefa
          )
        );
      }
    } catch (error) {
      console.error("Erro de rede ou servidor", error);
    }
  };

  const tarefasFazer = tarefas.filter((t) => t.status === "fazer");
  const tarefasFazendo = tarefas.filter((t) => t.status === "fazendo");
  const tarefasConcluido = tarefas.filter((t) => t.status === "concluido");

  return (
    <main className="containerQuadro" aria-labelledby="titulo-quadro">
      <h1 id="titulo-quadro">Quadro de Tarefas</h1>
      {erro && (
        <p role="alert" style={{ color: "red" }}>
          {erro}
        </p>
      )}

      <div className="containerQuadros">
        <section
          className="quadro"
          role="region"
          aria-labelledby="titulo-fazer"
        >
          <h2 id="titulo-fazer">A Fazer</h2>
          <Coluna
            tarefas={tarefasFazer}
            atualizarStatus={atualizarStatusTarefa}
          />
        </section>

        <section
          className="quadro"
          role="region"
          aria-labelledby="titulo-fazendo"
        >
          <h2 id="titulo-fazendo">Fazendo</h2>
          <Coluna
            tarefas={tarefasFazendo}
            atualizarStatus={atualizarStatusTarefa}
          />
        </section>

        <section
          className="quadro"
          role="region"
          aria-labelledby="titulo-concluido"
        >
          <h2 id="titulo-concluido">Pronto</h2>
          <Coluna
            tarefas={tarefasConcluido}
            atualizarStatus={atualizarStatusTarefa}
          />
        </section>
      </div>
    </main>
  );
}
