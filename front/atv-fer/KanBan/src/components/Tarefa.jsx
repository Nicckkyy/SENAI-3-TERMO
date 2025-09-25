import React, { useState, useEffect } from "react";
import "../styles/Tarefa.scss";

export default function Tarefa() {
  const [tarefas, setTarefas] = useState([]);
  const [erro, setErro] = useState("");
  const [statusFiltro, setStatusFiltro] = useState("fazer");
  const {attributes,listeners, setNodeRef, transform} = useDraggable({
    id: tarefa.id,
  });
  const style = transform
    ?{transform : `translate(${transform.x}px ), ${transform.y}px)`}
    :undefined;

  // Buscar tarefas pelo status
  const fetchTarefas = async () => {
    try {
      const response = await fetch(
        `http://127.0.0.1:8000/api/tarefas/?status=${statusFiltro}`
      );
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
  }, [statusFiltro]);

  return (
    <section className="tarefa-container" aria-labelledby="titulo-tarefas" ref={setNodeRef} style={style}>
      <h3 id={`tarefa-${tarefa.id}`}{...listeners}{...attributes}>{tarefa.descricao}</h3>

      {erro && (
        <p role="alert" style={{ color: "red" }}>
          {erro}
        </p>
      )}

      <div className="filtro">
        <label htmlFor="filtro-status">Filtrar por status:</label>
        <select
          id="filtro-status"
          value={statusFiltro}
          onChange={(e) => setStatusFiltro(e.target.value)}
          aria-describedby="filtro-status"
        >
          <option value="fazer">A Fazer</option>
          <option value="fazendo">Fazendo</option>
          <option value="concluido">Concluído</option>
        </select>
      </div>

      <ul className="tarefas-lista" aria-live="polite">
        {tarefas.length > 0 ? (
          tarefas.map((tarefa) => (
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
            </li>
          ))
        ) : (
          <p>Não há tarefas para exibir.</p>
        )}
      </ul>
    </section>
  );
}
