import React, { useState, useEffect } from "react";
import { useDroppable } from "@dnd-kit/core";
// Importamos o componente de tarefa individual
import Tarefa from "./Tarefa";
import "../styles/Coluna.scss"; // Importa o CSS da Coluna

// Recebe a ID da coluna e o Título como props
export default function Coluna({ id, titulo, tarefas, atualizarStatus }) {
  const [tarefasAtualizadas, setTarefasAtualizadas] = useState(tarefas);
  // Passamos a ID para o useDroppable
  const { setNodeRef } = useDroppable({ id });

  useEffect(() => {
    setTarefasAtualizadas(tarefas);
  }, [tarefas]);

  return (
    // CORRIGIDO: Adicionamos o container da coluna (div) com a classe e o ref
    <div className="coluna" ref={setNodeRef}>
      <h2 className="subtitulo" id={`titulo-${id}`}>
        {titulo}
      </h2>

      {/* Lista que contém os cards */}
      <ul className="lista-tarefas" aria-live="polite">
        {tarefasAtualizadas.length > 0 ? (
          tarefasAtualizadas.map((tarefa) => (
            // CORRIGIDO: Renderiza o componente Tarefa como um card individual
            <li key={tarefa.id} role="listitem">
              <Tarefa tarefa={tarefa} atualizarStatus={atualizarStatus} />
            </li>
          ))
        ) : (
          <p>Não há tarefas nesta coluna.</p>
        )}
      </ul>
    </div>
  );
}
