<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;

class AdminPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $method = $request->method();

        if ($request->bearerToken()) {
            $tokenExplode = explode(".", $request->bearerToken());
            $accountType = $tokenExplode[0];
            $token = $tokenExplode[1];
            $user = User::where('api_token', '=', $token)->first();

            if($user){
                if($user->role == $accountType && $accountType == 'admin'){
                    return $next($request);
                }
            }

            return response()->json(['message' => 'Invalid token.'], 404);
        } else {
            return response()->json(['message' => 'Token not found.'], 404);
        }
    }
}
