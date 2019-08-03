<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitf082b43e4b3df79ff84de942bbd82e20
{
    public static $files = array (
        '320cde22f66dd4f5d3fd621d3e88b98f' => __DIR__ . '/..' . '/symfony/polyfill-ctype/bootstrap.php',
        'a67d2085bcbddd4d3e6a89c42c283da1' => __DIR__ . '/../..' . '/load.environment.php',
    );

    public static $prefixLengthsPsr4 = array (
        'W' => 
        array (
            'Wikimedia\\Composer\\' => 19,
        ),
        'S' => 
        array (
            'Symfony\\Polyfill\\Ctype\\' => 23,
        ),
        'E' => 
        array (
            'ESN\\Satellite\\' => 14,
            'ESN\\Conditional\\' => 16,
        ),
        'D' => 
        array (
            'Dotenv\\' => 7,
        ),
        'C' => 
        array (
            'Composer\\Installers\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Wikimedia\\Composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/wikimedia/composer-merge-plugin/src',
        ),
        'Symfony\\Polyfill\\Ctype\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-ctype',
        ),
        'ESN\\Satellite\\' => 
        array (
            0 => __DIR__ . '/../..' . '/profiles/satellite/src/Satellite',
        ),
        'ESN\\Conditional\\' => 
        array (
            0 => __DIR__ . '/../..' . '/profiles/satellite/src/Conditional',
        ),
        'Dotenv\\' => 
        array (
            0 => __DIR__ . '/..' . '/vlucas/phpdotenv/src',
        ),
        'Composer\\Installers\\' => 
        array (
            0 => __DIR__ . '/..' . '/composer/installers/src/Composer/Installers',
        ),
    );

    public static $prefixesPsr0 = array (
        'J' => 
        array (
            'JsonMapper' => 
            array (
                0 => __DIR__ . '/..' . '/netresearch/jsonmapper/src',
            ),
        ),
    );

    public static $classMap = array (
        'PharIo\\Version\\AbstractVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/AbstractVersionConstraint.php',
        'PharIo\\Version\\AndVersionConstraintGroup' => __DIR__ . '/..' . '/phar-io/version/src/constraints/AndVersionConstraintGroup.php',
        'PharIo\\Version\\AnyVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/AnyVersionConstraint.php',
        'PharIo\\Version\\ExactVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/ExactVersionConstraint.php',
        'PharIo\\Version\\Exception' => __DIR__ . '/..' . '/phar-io/version/src/exceptions/Exception.php',
        'PharIo\\Version\\GreaterThanOrEqualToVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/GreaterThanOrEqualToVersionConstraint.php',
        'PharIo\\Version\\InvalidPreReleaseSuffixException' => __DIR__ . '/..' . '/phar-io/version/src/exceptions/InvalidPreReleaseSuffixException.php',
        'PharIo\\Version\\InvalidVersionException' => __DIR__ . '/..' . '/phar-io/version/src/exceptions/InvalidVersionException.php',
        'PharIo\\Version\\OrVersionConstraintGroup' => __DIR__ . '/..' . '/phar-io/version/src/constraints/OrVersionConstraintGroup.php',
        'PharIo\\Version\\PreReleaseSuffix' => __DIR__ . '/..' . '/phar-io/version/src/PreReleaseSuffix.php',
        'PharIo\\Version\\SpecificMajorAndMinorVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/SpecificMajorAndMinorVersionConstraint.php',
        'PharIo\\Version\\SpecificMajorVersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/SpecificMajorVersionConstraint.php',
        'PharIo\\Version\\UnsupportedVersionConstraintException' => __DIR__ . '/..' . '/phar-io/version/src/exceptions/UnsupportedVersionConstraintException.php',
        'PharIo\\Version\\Version' => __DIR__ . '/..' . '/phar-io/version/src/Version.php',
        'PharIo\\Version\\VersionConstraint' => __DIR__ . '/..' . '/phar-io/version/src/constraints/VersionConstraint.php',
        'PharIo\\Version\\VersionConstraintParser' => __DIR__ . '/..' . '/phar-io/version/src/VersionConstraintParser.php',
        'PharIo\\Version\\VersionConstraintValue' => __DIR__ . '/..' . '/phar-io/version/src/VersionConstraintValue.php',
        'PharIo\\Version\\VersionNumber' => __DIR__ . '/..' . '/phar-io/version/src/VersionNumber.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitf082b43e4b3df79ff84de942bbd82e20::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitf082b43e4b3df79ff84de942bbd82e20::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitf082b43e4b3df79ff84de942bbd82e20::$prefixesPsr0;
            $loader->classMap = ComposerStaticInitf082b43e4b3df79ff84de942bbd82e20::$classMap;

        }, null, ClassLoader::class);
    }
}
