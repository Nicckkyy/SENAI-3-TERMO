import {describe, it, expect} from 'vitest';

describe("Matematica basica de exemplo", ()=>{
    it("Soma 2+2", ()=>{
        expect( 2 + 2 ).toBe(4);
    });

    it("Subtração 20 - 5", ()=>{
        expect( 20 - 5 ).toBe(15);
    });    

    it("Multiplicação 5 * 50", ()=>{
        expect(5 * 50).toBe(250);
    });


})
