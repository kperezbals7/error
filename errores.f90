program errores
    implicit none
    integer i,j
    real bessel(100), x(100), y(100), ua, uc(100), media(100), nx, ndat, xact

    open(1, file='datos.dat')
    open(2, file='Resultados.dat')

    ndat = 0
    do i=1, 100
        read(1, *, end=50) x(i), y(i)
        ndat = ndat +1
    end do

50  write (*,*) 'Se han leido todos los datos. Cambiar delta en ua!!!'

    media=0.
    bessel= 0.
    j= 1
    nx= 0
    xact= x(1)

    do i= 1, ndat
        if (x(i).eq.xact) then
            nx= nx+1
            media(j) = media(j) + y(i)

        else
        media(j)= media(j)/nx

        nx= 1
        j=j+1
        xact = x(i)
        media(j)= y(i)
        end if

    end do

    if (nx.gt.0) then
        media(j)= media(j)/nx
    end if

    ua = 0.001 / sqrt(12.)

    j = 1
    nx = 0
    xact= x(1)

! ***************************************************
    do i= 1, ndat
        if (x(i).eq.xact) then
            nx= nx+1
            bessel(j) = bessel(j) + (y(i)-media(j))**2

        else
        ! cierro el bloque anterior
        if (nx.gt.1) then
            bessel(j)= sqrt(bessel(j)/(nx-1))
            uc(j)= sqrt(ua**2+ bessel(j)**2/nx)
        else
            uc(j)= ua
        endif

        ! actualizo el nuevo
        nx= 1
        j=j+1
        xact = x(i)
        bessel(j) = bessel(j) + (y(i)-media(j))**2
        end if
    end do

! calculo el ultimo bloque
    if (nx.gt.1) then
            bessel(j)= sqrt(bessel(j)/(nx-1))
            uc(j)= sqrt(ua**2+ bessel(j)**2/nx)
    else
        uc(j) = ua
    endif

! ******************************************************************


    do i=1, j
        write (2, *) 'Valor: ', i,'Media:', media(i), 'Error total ', uc(i)
    end do

    close(1)
    close(2)

end program
