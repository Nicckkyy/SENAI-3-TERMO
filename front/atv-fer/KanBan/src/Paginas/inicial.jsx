// src/Paginas/inicial.jsx

import { BarraNavegacao } from "../components/BarraNavegacao";
import Cabecalho from "../components/Cabecalho";
import { Outlet } from "react-router-dom";
import "../styles/main.scss";
import Quadro from "../components/Quadro";
import { CardUsuario } from "./CardUsuarios";
import { CardTarefas } from "./CardTarefas";
import "../styles/Inicial.scss";

export function Inicial() {
  return (
    <>
      <Cabecalho />
      <main>
        <Quadro />
        <section>
          <CardUsuario />
          {/* Renderize o componente com o nome correto */}
          <CardTarefas />
        </section>
      </main>
      <Outlet />
    </>
  );
}
