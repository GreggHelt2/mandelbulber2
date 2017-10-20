/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * ABoxModKali, a formula from Mandelbulb3D
 * @reference http://www.fractalforums.com/new-theories-and-research/aboxmodkali-the-2d-version/

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "AboxModKaliIteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 AboxModKaliIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	z = fractal->transformCommon.additionConstant0555 - fabs(z);
	REAL rr = dot(z, z);
	REAL MinR = fractal->transformCommon.minR06;
	REAL dividend = rr < MinR ? MinR : min(rr, 1.0f);
	REAL m = native_divide(fractal->transformCommon.scale015, dividend);
	z = z * m;
	aux->DE = mad(aux->DE, fabs(m), 1.0f);
	return z;
}