import React, { useState, useEffect } from "react";

export default function Coluna({ tarefas, atualizarStatus }) {
  const [tarefasAtualizadas, setTarefasAtualizadas] = useState(tarefas);

  useEffect(() => {
    setTarefasAtualizadas(tarefas);
  }, [tarefas]);

  return (
    <ul className="coluna" aria-live="polite">
      {tarefasAtualizadas.length > 0 ? (
        tarefasAtualizadas.map((tarefa) => (
          <li
            key={tarefa.id}
            className="tarefa-item"
            role="article"
            aria-label={`Tarefa com ID ${tarefa.id}, descrição: ${tarefa.descricao}`}
          >
            <p>
              <strong>Id:</strong> {tarefa.id}
            </p>
            <p>
              <strong>Descrição:</strong> {tarefa.descricao}
            </p>
            <p>
              <strong>Setor:</strong> {tarefa.setor}
            </p>
            <p>
              <strong>Prioridade:</strong> {tarefa.prioridade}
            </p>
            <p>
              <strong>Status:</strong> {tarefa.status}
            </p>

            <label htmlFor={`status-${tarefa.id}`}>Alterar status:</label>
            <select
              id={`status-${tarefa.id}`}
              value={tarefa.status}
              onChange={(e) => atualizarStatus(tarefa.id, e.target.value)}
            >
              <option value="fazer">A Fazer</option>
              <option value="fazendo">Fazendo</option>
              <option value="concluido">Concluído</option>
            </select>
          </li>
        ))
      ) : (
        <p>Não há tarefas nesta coluna.</p>
      )}
    </ul>
  );
}
