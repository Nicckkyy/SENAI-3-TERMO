import {render, screen, fireEvent, waitFor} from '@testing-library/react'

import { CardUsuario } from '../Paginas/CardUsuarios';
import {describe, it, expect} from 'vitest';
import { email } from 'zod';

describe("Cadastro de Usuário", ()=>{
    it("teste de validar os itens em tela", ()=>{
        render(<CardUsuario/>);

        const nomeInput = screen.getByLabelText(/Nome/i);
        const emailInput = screen.getByLabelText(/email/i)
        const botao = screen.getByRole('button', {name: /Cadastrar/i})

        expect(nomeInput).toBeTruthy();
        expect(emailInput).toBeTruthy();
        expect(botao).toBeTruthy();
    });

    it("Teste de campos vazios", async()=>{
        render(<CardUsuario/>);
        fireEvent.click(screen.getByRole("button", {name: /cadastrar/i}));

        await waitFor(()=>{
            expect(screen(getByText("O nome é obrigatório"))).toBeTruthy();
            expect(screen(getByText("Email inválido"))).toBeTruthy();
        })
    })
})