program rendija
    real a(3), w(3), er(3), media, erro, sumaa, sumaw
    integer i

! cambiar limites del array a mano 
    open (1, file='datos.dat')

    do i=1, 3
        read (1, *) a(i), er(i)
    end do

    do i=1, 3
        w(i) = 1. / (er(i)**2)
    end do

    sumaa = 0.
    sumaw = 0.

    do i=1, 3
        sumaa = sumaa + a(i)*w(i)
        sumaw = sumaw + w(i)
    end do

    media = sumaa / sumaw
    erro = 1. / (sqrt(sumaw))

    write (*,*) media
    write (*,*) erro
end program
