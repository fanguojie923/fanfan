# use Symfony\Component\Validator\Constraints as Assert; #
	 * @Assert\Count(
     *      min = 1,
     *      max = 5,
     *      minMessage = "You must specify at least one email",
     *      maxMessage = "You cannot specify more than {{ limit }} emails"
     * )