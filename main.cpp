#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <fstream>
#include "menu.h"
#include "Matriz.h"


#include <ctime>

int main(int argc, char** argv) {
    
    unsigned t0,t1;
    
    t0 = clock();
    
    if (argc > 4) {
        std::string archivo_entrada(obtener_entrada(argv, argc));
        std::string archivo_salida(obtener_salida(argv, argc));

        if (!archivo_entrada.empty() && !archivo_salida.empty()) {

            std::ifstream entrada(archivo_entrada);
            std::ofstream salida(archivo_salida);
            std::string linea;
            
            int hilos = omp_get_num_threads();
            std::cout << "Numero de hilos "<<  hilos+1 << std::endl;
            
            while (std::getline(entrada, linea)) {
                
                Matriz matriz(linea);
                
                if (matriz.esMagico()) {
                    std::string str = matriz.toString();

                    salida.write(str.c_str(), str.size());
                }
                   
                linea.clear();
                
            }

            entrada.close();
            salida.close();
            
            std::cout << "Exito" << std::endl;
            
            t1 = clock();
    
            double time = (double(t1-t0)/CLOCKS_PER_SEC);
            std::cout <<"Tiempo de ejecucion: "<< time << "seg" <<std::endl;

            return EXIT_SUCCESS;
        } else {
            std::cerr << std::endl << "Error al determinar las rutas de los archivos de entrada " << archivo_entrada << " y salida " << archivo_salida << std::endl;
            return EXIT_FAILURE;
        }
    } else {
        std::cerr << std::endl << "Argumentos insuficientes" << std::endl;
        std::cerr << std::endl << argv[0] << " -f /ruta/archivo/entrada.txt -o /ruta/archivo/salida.txt" << std::endl;
        return EXIT_FAILURE;
    }
    
    
    return EXIT_SUCCESS;
}