/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * spherical invert
 * from M3D. Formula by Luca GN 2011, updated May 2012.
 * @reference
 * http://www.fractalforums.com/mandelbulb-3d/custom-formulas-and-transforms-release-t17106/

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "TransfSphericalInvIteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfSphericalInvIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL r2Temp = dot(z, z);
	z += fractal->mandelbox.offset;
	z *= fractal->transformCommon.scale;
	aux->DE = mad(aux->DE, fabs(fractal->transformCommon.scale), 1.0f);

	REAL r2 = dot(z, z);
	if (fractal->transformCommon.functionEnabledyFalse) r2 = r2Temp;
	REAL mode = r2;
	if (fractal->transformCommon.functionEnabledFalse) // Mode 1
	{
		if (r2 > fractal->transformCommon.minRNeg1) mode = 1.0f;
		if (r2 < fractal->mandelbox.fR2 && r2 > fractal->transformCommon.minRNeg1)
			mode = fractal->transformCommon.minRNeg1;
		if (r2 < fractal->mandelbox.fR2 && r2 < fractal->transformCommon.minRNeg1)
			mode = fractal->transformCommon.minRNeg1;
	}
	if (fractal->transformCommon.functionEnabledxFalse) // Mode 2
	{
		if (r2 > fractal->transformCommon.minRNeg1) mode = 1.0f;
		if (r2 < fractal->mandelbox.fR2 && r2 > fractal->transformCommon.minRNeg1)
			mode = fractal->transformCommon.minRNeg1;
		if (r2 < fractal->mandelbox.fR2 && r2 < fractal->transformCommon.minRNeg1)
			mode = mad(2.0f, fractal->transformCommon.minRNeg1, -r2);
	}
	mode = native_recip(mode);
	z *= mode;
	aux->DE *= mode;

	z -= fractal->mandelbox.offset + fractal->transformCommon.additionConstant000;
	return z;
}