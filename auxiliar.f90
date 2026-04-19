program aux
    real lambda, b, errores, l, a, errora
!cambiar valores a mano
    lambda = 512E-9
    l = 1.1
    b = 3.50E-03
    errores = 0.001 / sqrt(12)

    a = (2*l*lambda) / b
    errora = sqrt(((2*lambda*errores)/b)**2+((2*l*lambda*errores)/b**2)**2)

    write (*,*) a
    write (*,*) errora

end program
