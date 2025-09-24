import { render, screen } from "@testing-library/react";
import '@testing-library/jest-dom'
import { Cabecalho} from '../components/Cabecalho'
import { it } from "zod/locales";

describe('Compomentes de cabecalho', ()=>{
    it('renderiza o titiulo', ()=>{
        render(<Cabecalho/>)
        expect(screen.getByText("Gerenciamento de Tarefas")).toBeInTheDocument();
    } );

    it('Use a tag header com a classe correrta?', ()=>{
        const header = screen.getByRole("banner");
        expect(header).toHaveClass("cabecalho");
    })
})