import React, { useState, useEffect } from "react";
// Importamos o componente de card de tarefa
import Tarefa from "./Tarefa";
// Importamos a Coluna.js para envolver os cards
import Coluna from "./Coluna";
import "../styles/Quadro.scss";
import { DndContext } from "@dnd-kit/core";

export default function Quadro() {
  const [tarefas, setTarefas] = useState([]);
  const [erro, setErro] = useState("");

  // ... (fetchTarefas, useEffect, atualizarStatusTarefa permanecem inalterados) ...
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
      const response = await fetch(`http://127.00.1:8000/api/tarefas/${id}/`, {
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

  function handleDragEnd(event) {
    const { active, over } = event;
    if (over && active) {
      const tarefaId = active.id;
      const novaColuna = over.id;

      setTarefas((prev) =>
        prev.map((tarefa) =>
          tarefa.id === tarefaId ? { ...tarefa, status: novaColuna } : tarefa
        )
      );

      // Corrigido: usando a função fetch em vez de axios indefinido
      atualizarStatusTarefa(tarefaId, novaColuna);
    }
  }

  const tarefasFazer = tarefas.filter((t) => t.status === "fazer");
  const tarefasFazendo = tarefas.filter((t) => t.status === "fazendo");
  const tarefasConcluido = tarefas.filter((t) => t.status === "concluido");

  return (
    <main className="containerQuadro" aria-labelledby="titulo-quadro">
      {/* CORRIGIDO: DndContext envolve todo o conteúdo arrastável */}
      <DndContext onDragEnd={handleDragEnd}>
        <h1 className="tituloQuadro" id="titulo-quadro">
          Quadro de Tarefas
        </h1>
        {erro && (
          <p role="alert" style={{ color: "red" }}>
            {erro}
          </p>
        )}

        <div className="containerQuadros">
          {/* CORRIGIDO: Usando a classe 'coluna' e passando a ID para o useDroppable */}
          <Coluna
            id="fazer"
            titulo="A Fazer"
            tarefas={tarefasFazer}
            atualizarStatus={atualizarStatusTarefa}
          />

          <Coluna
            id="fazendo"
            titulo="Fazendo"
            tarefas={tarefasFazendo}
            atualizarStatus={atualizarStatusTarefa}
          />

          <Coluna
            id="concluido"
            titulo="Pronto"
            tarefas={tarefasConcluido}
            atualizarStatus={atualizarStatusTarefa}
          />
        </div>
      </DndContext>
    </main>
  );
}
