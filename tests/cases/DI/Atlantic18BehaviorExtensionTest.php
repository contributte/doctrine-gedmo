<?php declare(strict_types = 1);

namespace Tests\Nettrine\Extensions\Atlantic18\DI;

use Nette\DI\Compiler;
use Nette\DI\Container;
use Nette\DI\ContainerLoader;
use Nettrine\Extensions\Atlantic18\DI\Atlantic18BehaviorExtension;
use Tester\Assert;
use Tester\TestCase;

require __DIR__ . '/../../bootstrap.php';

final class Atlantic18BehaviorExtensionTest extends TestCase
{

	public function testDefault(): void
	{
		$loader = new ContainerLoader(__DIR__ . '/../../tmp', true);
		$class = $loader->load(static function (Compiler $compiler): void {
			$compiler->addExtension('extensions', new Atlantic18BehaviorExtension());
		}, '1a');

		$container = new $class();

		Assert::type(Container::class, $container);
	}

}

(new Atlantic18BehaviorExtensionTest())->run();
