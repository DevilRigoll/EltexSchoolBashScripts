#!/usr/bin/env bash

# sed-ом заменяем символы латиницы на символы кирилицы
TRS=`echo $1 | sed "y/abvgdeeziilmnopruf/абвгдеёзийлмнопруф/"`
TRS=`echo $TRS  | sed "y/ABVGDEEZIILMNOPRUF/АБВГДЕЁЗИЙЛМНОПРУФ/"`
TRS=${TRS//zh/ж};
TRS=${TRS//kh/х};
TRS=${TRS//ch/ч};
TRS=${TRS//sh/ш};
TRS=${TRS//sch/щ};
TRS=${TRS//yu/ю};
TRS=${TRS//ya/я};
TRS=${TRS//tc/ц};
TRS=${TRS//s/с};
TRS=${TRS//k/к};
TRS=${TRS//K/к};
TRS=${TRS//e/э};
TRS=${TRS//t/т}

echo $TRS
