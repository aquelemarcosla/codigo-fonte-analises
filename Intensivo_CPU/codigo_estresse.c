#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 2000

int main() {
    /*Matrizes*/
    double *A = malloc(SIZE * SIZE * sizeof(double));
    double *B = malloc(SIZE * SIZE * sizeof(double));
    double *R = malloc(SIZE * SIZE * sizeof(double));

    /*Verificação de alocação*/
    if (!A || !B || !R) return 1;

    /*Iniciação das matrizes*/
    for (int i = 0; i < SIZE * SIZE; i++) {
        A[i] = (double)i + 1.0;
        B[i] = (double)i + 2.0;
    }

    /*Medição do tempo de clock*/
    clock_t start = clock();

    /*Operação com as matrizes*/
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            double temp = A[i * SIZE + j];
            for (int k = 0; k < SIZE; k++) {
                temp /= B[k * SIZE + j];
            }
            R[i * SIZE + j] = temp;
        }
    }

    /*Termino da medição e exibição dos resultados*/
    clock_t end = clock();
    printf("Tempo: %.4f s | Check: %e\n", (double)(end - start) / CLOCKS_PER_SEC, R[0]);

    /*Liberando memória usada*/
    free(A); free(B); free(R);
    return 0;
}