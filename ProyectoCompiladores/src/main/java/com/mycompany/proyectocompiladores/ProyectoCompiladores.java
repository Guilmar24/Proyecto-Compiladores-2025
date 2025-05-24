/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.proyectocompiladores;

import java.io.FileReader;

/**
 *
 * @author kinch
 */
public class ProyectoCompiladores {

    public static void main(String[] args) throws Exception {
        Lexer lexer = new Lexer(new FileReader("test.txt"));  // Archivo de entrada
        Parser parser = new Parser(lexer);
        parser.parser();
        System.out.println("¡Análisis completado sin errores!");
    }
}