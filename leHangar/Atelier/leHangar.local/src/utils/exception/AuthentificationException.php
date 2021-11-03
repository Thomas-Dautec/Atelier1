<?php

namespace app\utils\exception;

class AuthentificationException extends \Exception { 

    public function __construct($message, $code = 0, Throwable $previous = null) {
        parent::__construct($message, $code, $previous);
    }
}