REM Autor: Serafi Lliteres Servera
@echo off
setlocal EnableDelayedExpansion
cls
echo Benvingut %1
echo Benvingut %1 >> DiaMesAnyHoraMinutSegon.log
:menu
echo Tria una de les seguents opcions
echo Operacions basiques entre dos operands = 1
echo Factorial d'un nombre = 2
echo Sequencia de numeros de Fibonacci fins a arribar al numero escollit = 3
echo Generador de contrasenyes = 4
echo Canvi de color de fons i de lletra de la terminal = 5
echo Recorrer un fitxer .csv que te dues columnes (producte, preu) i treure per pantalla el producte mes car = 6
echo Sortir = 7
set opcio=0
set /p opcio=
cls
if !opcio! equ 1 (
    goto operacionsBasiques
) else if !opcio! equ 2 (
    goto factorial
) else if !opcio! equ 3 (
    goto fibonacci
) else if !opcio! equ 4 (
    goto generadorContrasenyes
) else if !opcio! equ 5 (
    goto canviColor
) else if !opcio! equ 6 (
    goto producteMesCar
) else if !opcio! equ 7 (
    goto sortida
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto menu
:operacionsBasiques
echo Tria una de les seguents opcions
echo Suma = 1
echo Resta = 2
echo Multiplicacio = 3
echo Divisio = 4
echo Tornar al menu principal = 5
set opcio=0
set /p opcio=
set num1=0
set num2=0
set resultat=0
cls
if !opcio! geq 1 if !opcio! leq 4 (
    set /p num1="Introdueix el primer numero: "
    set /p num2="Introdueix el segon numero: "
)
if !opcio! equ 1 (
    set /a resultat=!num1!+!num2!
    echo El resultat de la suma es !resultat!
    echo El resultat de la suma es !resultat! >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
) else if !opcio! equ 2 (
    set /a resultat=!num1!-!num2!
    echo El resultat de la resta es !resultat!
    echo El resultat de la resta es !resultat! >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
) else if !opcio! equ 3 (
    set /a resultat=!num1!*!num2!
    echo El resultat de la multiplicacio es !resultat!
    echo El resultat de la multiplicacio es !resultat! >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
) else if !opcio! equ 4 (
    if !num2! neq 0 (
        set /a resultat=!num1!/!num2!
        echo El resultat de la divisio es !resultat!
        echo El resultat de la divisio es !resultat! >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
    ) else (
        echo Error, has d'introduir un numero diferent a 0 en el segon numero
        echo Error, has d'introduir un numero diferent a 0 en el segon numero >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
    )
) else if !opcio! equ 5 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto operacionsBasiques
:factorial
echo Tria una de les seguents opcions
echo Factorial d'un nombre = 1
echo Tornar al menu principal = 2
set opcio=0
set /p opcio=
set num=0
set numFactorial=1
cls
if !opcio! equ 1 (
    set /p num="Introdueix un numero: "
    for /L %%i in (1, 1, !num!) do (
        set /a numFactorial=!numFactorial!*%%i
    )
    echo El factorial de !num! es !numFactorial!
    echo El factorial de !num! es !numFactorial! >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
) else if !opcio! equ 2 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto factorial
:fibonacci
echo Tria una de les seguents opcions
echo Sequencia de numeros de Fibonacci fins a arribar al numero escollit = 1
echo Tornar al menu principal = 2
set opcio=0
set /p opcio=
set numeroEscollit=0
set a=0
set b=1
set c=0
cls
if !opcio! equ 1 (
    set /p numeroEscollit="Introdueix un numero: "
    echo Sequencia de numeros de Fibonacci:
    echo Sequencia de numeros de Fibonacci: >> DiaMesAnyHoraMinutSegon.log
    goto bucleFibonacci
    :bucleFibonacci
    if !c! leq !numeroEscollit! (
        echo !c!
        echo !c! >> DiaMesAnyHoraMinutSegon.log
        if !c! equ 1 (
            echo !c!
            echo !c! >> DiaMesAnyHoraMinutSegon.log
        )
        set /a c=!a!+!b!
        set a=!b!
        set b=!c!
        goto bucleFibonacci
    )
    pause
    cls
    goto fibonacci
) else if !opcio! equ 2 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto fibonacci
:generadorContrasenyes
echo Tria una de les seguents opcions
echo Generador de contrasenyes = 1
echo Tornar al menu principal = 2
set opcio=0
set /p opcio=
set longitud=0
set inclouNumeros=0
set contador=1
set contrasenya=
cls
if !opcio! equ 1 (
    set /p inclouNumeros="Vols que la contrasenya contingui numeros? (Si --> s / No --> n): "
    if !inclouNumeros! equ n (
        set /p longitud="Quina longitud vols que tengui la contrasenya? (minim 2): "
        if !longitud! geq 2 (
            goto bucleContrasenya1
            :bucleContrasenya1
            if !contador! leq !longitud! (
                set /a resto=!contador! %% 2
                if !resto! neq 0 (
                    set /a numrandom=!random! %%25 + 65
                    for /L %%i in (65,1,90) do (
                        cmd /c exit %%i
                        if %%i equ !numrandom! (
                        set rand=!=exitcodeAscii!
                        set contrasenya=!contrasenya!!rand!
                        set /a contador=!contador!+1
                        goto bucleContrasenya1
                        )
                    )
                ) else if !resto! equ 0 (
                    set /a numrandom=!random! %%25 + 97
                    for /L %%i in (97,1,122) do (
                        cmd /c exit %%i
                        if %%i equ !numrandom! (
                        set rand=!=exitcodeAscii!
                        set contrasenya=!contrasenya!!rand!
                        set /a contador=!contador!+1
                        goto bucleContrasenya1
                        )
                    )
                )
            ) else (
                echo Contrasenya: !contrasenya!
                echo Contrasenya: !contrasenya! >> DiaMesAnyHoraMinutSegon.log
                pause
                cls
                goto generadorContrasenyes
            )
        ) else (
            echo Error, has d'introduir una longitud mes gran o igual a 2
            echo Error, has d'introduir una longitud mes gran o igual a 2 >> DiaMesAnyHoraMinutSegon.log
            pause
            cls
            goto generadorContrasenyes
        )
    ) else if !inclouNumeros! equ s (
        set /p longitud="Quina longitud vols que tengui la contrasenya? (minim 3): "
        if !longitud! geq 3 (
            goto bucleContrasenya2
            :bucleContrasenya2
            if !contador! leq !longitud! (
                set /a resto=!contador! %% 3
                if !resto! equ 1 (
                    set /a numrandom=!random! %%25 + 65
                    for /L %%i in (65,1,90) do (
                        cmd /c exit %%i
                        if %%i equ !numrandom! (
                            set rand=!=exitcodeAscii!
                            set contrasenya=!contrasenya!!rand!
                            set /a contador=!contador!+1
                            goto bucleContrasenya2
                        )
                    )
                ) else if !resto! equ 2 (
                    set /a numrandom=!random! %%25 + 97
                    for /L %%i in (97,1,122) do (
                        cmd /c exit %%i
                        if %%i equ !numrandom! (
                            set rand=!=exitcodeAscii!
                            set contrasenya=!contrasenya!!rand!
                            set /a contador=!contador!+1
                            goto bucleContrasenya2
                        )
                    )
                ) else (
                    set /a numrandom=!random! %%10 + 48
                    for /L %%i in (48,1,57) do (
                        cmd /c exit %%i
                        if %%i equ !numrandom! (
                            set rand=!=exitcodeAscii!
                            set contrasenya=!contrasenya!!rand!
                            set /a contador=!contador!+1
                            goto bucleContrasenya2
                        )
                    )
                )
            ) else (
                echo Contrasenya: !contrasenya!
                echo Contrasenya: !contrasenya! >> DiaMesAnyHoraMinutSegon.log
                pause
                cls
                goto generadorContrasenyes
            )
        ) else (
            echo Error, has d'introduir una longitud mes gran o igual a 3
            echo Error, has d'introduir una longitud mes gran o igual a 3 >> DiaMesAnyHoraMinutSegon.log
            pause
            cls
            goto generadorContrasenyes
        )
    ) else (
        echo Error, has d'introduir una opcio correcta
        echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
        goto generadorContrasenyes
    )
) else if !opcio! equ 2 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto generadorContrasenyes
:canviColor
echo Tria una de les seguents opcions
echo Canvi de color de fons i de lletra de la terminal = 1
echo Tornar al menu principal = 2
set opcio=0
set /p opcio=
set colorsDisponibles=0 1 2 3 4 5 6 7 8 9 A B C D E F
cls
if !opcio! equ 1 (
    :alternativaColorsIguals
    set /a indexRandom=!random! %% 16
    set contador=0
    for %%i in (!colorsDisponibles!) do (
        if !contador! equ !indexRandom! (
            set colorRandom1=%%i
            goto trobat1
        )
        set /a contador=!contador!+1
    )
    :trobat1
    set /a indexRandom=!random! %% 16
    set contador=0
    for %%i in (!colorsDisponibles!) do (
        if !contador! equ !indexRandom! (
            set colorRandom2=%%i
            goto trobat2
        )
        set /a contador=!contador!+1
    )
    :trobat2
    echo Canviant el color de fons i de lletra de la terminal...
    echo Canviant el color de fons i de lletra de la terminal... >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
    if !colorRandom1! equ !colorRandom2! (
        echo Els dos colors que s'han generat aleatoriament coincideixen i, per tal que puguis veure el que hi ha escrit, es generaran aleatoriament uns altres colors
        echo Els dos colors que s'han generat aleatoriament coincideixen i, per tal que puguis veure el que hi ha escrit, es generaran aleatoriament uns altres colors >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
        goto alternativaColorsIguals
    )
    color !colorRandom1!!colorRandom2!
    goto canviColor
) else if !opcio! equ 2 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto canviColor
:producteMesCar
echo Tria una de les seguents opcions
echo Recorrer un fitxer .csv que te dues columnes (producte, preu) i treure per pantalla el producte mes car = 1
echo Tornar al menu principal = 2
set opcio=0
set /p opcio=
set fitxer=0
set maximPreu=0
set maximProducte=0
cls
if !opcio! equ 1 (
    set /p fitxer="Introdueix la ruta absoluta del fitxer .csv: "
    if exist !fitxer! (
        for /f "skip=1 tokens=1,2 delims=," %%a in (!fitxer!) do (
            if %%b gtr !maximPreu! (
                set maximPreu=%%b
                set maximProducte=%%a
            )
        )
        echo Nom del producte mes car: !maximProducte!
        echo Nom del producte mes car: !maximProducte! >> DiaMesAnyHoraMinutSegon.log
        echo Preu del producte mes car: !maximPreu!
        echo Preu del producte mes car: !maximPreu! >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
        goto producteMesCar
    ) else (
        echo Error, el fitxer no existeix
        echo Error, el fitxer no existeix >> DiaMesAnyHoraMinutSegon.log
        pause
        cls
        goto producteMesCar
    )
) else if !opcio! equ 2 (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
)
goto producteMesCar
:sortida
set confirmacio=0
set /p confirmacio="Estas segur que vols sortir? (Si --> s / No --> n): "
cls
if !confirmacio! == s (
    goto sortidaDefinitiva
) else if !confirmacio! == n (
    goto menu
) else (
    echo Error, has d'introduir una opcio correcta
    echo Error, has d'introduir una opcio correcta >> DiaMesAnyHoraMinutSegon.log
    pause
    cls
    goto sortida
)
:sortidaDefinitiva