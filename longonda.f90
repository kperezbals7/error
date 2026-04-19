program londa
    real l, d, long, eror, u, linea

    l = 0.193
    d = 1.57E-02
    linea = (1. / 94488)
    u = 0.001 / sqrt(12.)

    long = (linea*d) / (sqrt(d**2+l**2))
    eror = (d*sqrt(l**2 * u**2 + l**2 * d**2 * u**2)) / (d**2 + l**2)**(3/2)

    write (*,*) long
    write (*,*) eror

end program
