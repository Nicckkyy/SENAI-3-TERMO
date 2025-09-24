import { Link } from "react-router-dom";

export function BarraNavegacao() {
  return (
    <nav className="barra" aria-label="Menu principal">
      <ul>
        <li>
          <Link to="/cadUsuario">Cadastro de Usuário</Link>
        </li>
        <li>
          <Link to="/cadTarefa">Cadastro de Tarefas</Link>
        </li>
        <li>
          <Link to="/tarefas">Gerenciamento de Tarefas</Link>
        </li>
      </ul>
    </nav>
  );
}
