![](https://heatbadger.now.sh/github/readme/contributte/doctrine-gedmo/?deprecated=1)

<p align=center>
    <a href="https://bit.ly/ctteg"><img src="https://badgen.net/badge/support/gitter/cyan"></a>
    <a href="https://bit.ly/cttfo"><img src="https://badgen.net/badge/support/forum/yellow"></a>
    <a href="https://contributte.org/partners.html"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
</p>

<p align=center>
    Website 🚀 <a href="https://contributte.org">contributte.org</a> | Contact 👨🏻‍💻 <a href="https://f3l1x.io">f3l1x.io</a> | Twitter 🐦 <a href="https://twitter.com/contributte">@contributte</a>
</p>

## Disclaimer

| :warning: | This project is no longer being maintained. Please use [nettrine/extensions-atlantic18](https://github.com/contributte/doctrine-extensions-atlantic18).
|---|---|

| Composer | [`nettrine/extensions`](https://packagist.org/packages/nettrine/extensions) |
|---| --- |
| Version | ![](https://badgen.net/packagist/v/nettrine/extensions) |
| PHP | ![](https://badgen.net/packagist/php/nettrine/extensions) |
| License | ![](https://badgen.net/github/license/contributte/doctrine-gedmo) |

## Documentation

Doctrine ([Atlantic18/DoctrineExtensions](https://github.com/Atlantic18/DoctrineExtensions)) extension for Nette Framework.

### Setup

1. First of all, ensure you have installed [nettrine/dbal](https://github.com/contributte/doctrine-dbal) and [Nettrine ORM](https://github.com/contributte/doctrine-orm) packages.

2. Configure Nette DI extension.

  ```neon
  // config/config.neon
  extensions:
    nettrine.extensions.atlantic18: Nettrine\Extensions\Atlantic18\DI\Atlantic18BehaviorExtension
  ```

### Configuration

By default all listeners are disabled, enable only required listeners.

```neon
nettrine.extensions.atlantic18:
	loggable: off
	sluggable: off
	softDeleteable: off
	treeable: off
	blameable: off
	timestampable: off
	translatable: off
	uploadable: off
	sortable: off
	ipTraceable: off
```

#### Loggable, Translatable, Treeable

Setup extra entity mapping.

```neon
extensions:
	orm.annotations: Nettrine\ORM\DI\OrmAnnotationsExtension

orm.annotations:
	paths:
		# your app entities
		- App/Model/Database/Entity
		# doctrine extensions entities
		- Gedmo\Loggable\Entity
		- Gedmo\Loggable\Entity
		- Gedmo\Tree\Entity
```

If you using `nettrine/dbal` all listeners are registered automatically, or you have to register it manually:

```php
// Get EventManager, from DI or Entity Manager
$evm = $em->getEventManager();

// Register desired listener to event
$evm->addEventSubscriber($listener);

```
#### [Translatable](https://github.com/Atlantic18/DoctrineExtensions/blob/v2.4.x/doc/translatable.md)

TranslatableListener has a complex configuration:

```neon
nettrine.extensions.atlantic18:
	translatable:
		translatable: cs_CZ
		default: cs_CZ
		translationFallback: off
		persistDefaultTranslation: off
		skipOnLoad: off
```

#### [IpTraceable](https://github.com/Atlantic18/DoctrineExtensions/blob/v2.4.x/doc/ip_traceable.md)

IpTraceable requires client IP address:

```neon
nettrine.extensions.atlantic18:
	ipTraceable:
		ipValue: @Nette\Http\IRequest::getRemoteAddress()
```

## Development

This package was maintain by these authors.

<a href="https://github.com/f3l1x">
  <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>

-----

Consider to [support](https://contributte.org/partners.html) **contributte** development team.
Also thank you for being used this package.
