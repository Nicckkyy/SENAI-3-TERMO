import { BarraNavegacao } from "./BarraNavegacao";

export default function Cabecalho() {
  return (
    <header className="cabecalho" role="banner">
      <h1 className="titulo">Gerenciamento de Tarefas</h1>
      {/* CORRIGIDO: Mantém a barra de navegação dentro do cabeçalho */}
      <BarraNavegacao />
    </header>
  );
}
