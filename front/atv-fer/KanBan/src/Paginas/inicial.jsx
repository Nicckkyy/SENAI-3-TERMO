// src/Paginas/inicial.jsx

import { BarraNavegacao } from "../components/BarraNavegacao";
import Cabecalho from "../components/Cabecalho";
import { Outlet } from "react-router-dom";
import "../styles/main.scss";
// REMOVIDO: import Quadro from "../components/Quadro"; // Será renderizado via rota
// REMOVIDO: import { CardUsuario } from "./CardUsuarios"; // Será renderizado via rota
// REMOVIDO: import { CardTarefas } from "./CardTarefas"; // Será renderizado via rota
import "../styles/Inicial.scss";

export function Inicial() {
  return (
    <>
      <Cabecalho />
      {/* A Barra de Navegação será essencial para ligar 
        as rotas do Quadro, Cadastro Usuário e Cadastro Tarefa.
        Por exemplo: /quadro, /cadastro-usuario, /cadastro-tarefa.
      */}
      <BarraNavegacao />

      <main>
        {/* O Outlet irá carregar a página específica da rota (Quadro, Cadastro) */}
        <Outlet />
      </main>
    </>
  );
}
