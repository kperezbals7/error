program londa
    real l(0:2), d(0:2), long(0:2), eror(0:2), u, linea

    open(1, file='datos.dat')

    do i=0, 2
        read(1,*) l(i), d(i)
    end do
    linea = (1. / 295275)
    u = 0.001 / sqrt(12.)

    do i=0,2
    long(i) = (linea*d(i)) / (sqrt(d(i)**2+l(i)**2))
    eror(i) = linea / (d(i)**2 + l(i)**2)**(3./2.) * (d(i) *sqrt(l(i)**2 * u**2 + l(i)**2 * d(i)**2 * u**2))


    end do

    do i=0, 2
    write (*,*) long(i), eror(i)

    end do


end program
