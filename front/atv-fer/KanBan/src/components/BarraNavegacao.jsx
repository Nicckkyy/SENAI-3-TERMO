import { Link } from "react-router-dom";
import "../styles/BarraNavegacao.scss"; // Certifique-se de importar o SCSS

export function BarraNavegacao() {
  return (
    <nav className="barra" aria-label="Menu principal">
      <ul>
        <li>
          <Link to="/cadastro-usuario">Cadastro de Usuário</Link>
        </li>
        <li>
          <Link to="/cadastro-tarefa">Cadastro de Tarefas</Link>
        </li>
        <li>
          <Link to="/">Gerenciamento de Tarefas</Link>
        </li>
      </ul>
    </nav>
  );
}
