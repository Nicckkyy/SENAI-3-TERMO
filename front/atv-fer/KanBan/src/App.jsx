import './styles/main.scss'
import { BarraNavegacao } from './components/BarraNavegacao'
import { CardUsuario } from './Paginas/CardUsuarios'
import { CardTarefa } from "./Paginas/CardTarefas";

export default function App() {
  const [currentPage, setCurrentPage] = useState("home");

  let content;
  switch (currentPage) {
    case "usuario":
      content = <CardUsuario />;
      break;
    case "tarefa":
      content = <CardTarefas />;
      break;
    default:
      content = (
        <div className="flex flex-col items-center justify-center p-8 bg-white rounded-xl shadow-lg max-w-lg">
          <h1 className="text-4xl font-bold text-gray-900 mb-6 text-center">
            Menu Principal
          </h1>
          <button
            onClick={() => setCurrentPage("usuario")}
            className="w-full max-w-xs py-3 px-6 mb-4 text-lg font-medium text-white bg-blue-600 rounded-md shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200"
          >
            Cadastro de Usuário
          </button>
          <button
            onClick={() => setCurrentPage("tarefa")}
            className="w-full max-w-xs py-3 px-6 text-lg font-medium text-white bg-blue-600 rounded-md shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200"
          >
            Cadastro de Tarefa
          </button>
        </div>
      );
  }

  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-4 bg-gray-100">
      {content}
    </div>
  );
}
