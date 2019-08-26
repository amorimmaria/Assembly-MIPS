.data   #Declaração das variáveis
	msgnum1:   .asciiz "Digite o primeiro numero: "		#'.asciiz' para strings no formato ASCII.
	num1:	   .word 1					#'.word' para inteiros
	msgnum2:   .asciiz "Digite o segundo numero: "
	num2:	   .word 1
	resultado: .asciiz "O resultado da soma é: "

.text   #representa a parte do programa onde estará o código a ser executado
main:	
	li $v0, 4  	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,msgnum1  # O'la'significa "Load Adress" e está passando p/ o REG o argumento '$a0' o END de memória onde está armazenado o 'msgnum1'
	syscall		# O syscall interpreta que é para imprimir uma mensagem no console e recebe como argumento a 'msgnum1'.

	li $v0,5	# O 'li' passa a instrução p/ o 'syscall', o código '5' se refere à leitura de um inteiro, o 'syscall' executa a leitura.
	syscall		


	move $t0, $v0	#O comando 'move' move o valor de $v0 para $t0

	li $v0,4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,msgnum2  # O'la'significa "Load Adress" e está passando p/ o REG o argumento '$a0' o END de memória onde está armazenado o 'msgnum2'
	syscall		# O syscall interpreta que é para imprimir uma mensagem no console e recebe como argumento a 'msgnum2'.
	
	li $v0,5	# O 'li' passa a instrução p/ o 'syscall', o código '5' se refere à leitura de um inteiro, o 'syscall' executa a leitura.
	syscall


	move $t1, $v0	#O comando 'move' move o valor de $v0 para o registrador  $t1

	add $t2, $t0, $t1 #soma o valor de $t0 com $t1 e guarda no $t2

	#imprime a mensagem resultado
	li $v0,4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,resultado  
	syscall

	#imprime o resultado
	li $v0,1	# O código '1' se refere à impressão de um inteiro no console.	
	move $a0, $t2	#O comando 'move' move o valor de $t2 para $a0
	syscall

	jr $ra  #retornar do main
		   
	
	
